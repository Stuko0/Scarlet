import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:scarlet_app/core/network/dio_client.dart';
import 'package:scarlet_app/features/routing/domain/route_entity.dart';
import 'package:scarlet_app/features/routing/domain/route_repository.dart';
import 'package:scarlet_app/features/routing/domain/tile_key.dart';
import 'dijkstra_router.dart';
import 'tile_cache.dart';

final tileCacheProvider = Provider<TileCache>((ref) {
  return TileCache(dio: ref.watch(dioProvider));
});

final routeRepositoryProvider = Provider<RouteRepository>((ref) {
  return RouteRepositoryImpl(
    tileCache: ref.watch(tileCacheProvider),
    dio: ref.watch(dioProvider),
  );
});

class RouteRepositoryImpl implements RouteRepository {
  final TileCache _tileCache;

  RouteRepositoryImpl({required TileCache tileCache, required Dio dio})
      : _tileCache = tileCache;

  @override
  Future<void> ensureInitialTiles(LatLng location) async {
    final key = TileKey.fromLocation(location.latitude, location.longitude);
    await _tileCache.ensureTile(key);
    for (final neighbor in key.neighbors()) {
      await _tileCache.ensureTile(neighbor);
    }
  }

  @override
  Future<Route> getRoute(LatLng from, LatLng to) async {
    await _tileCache.ensureTilesForRoute(from, to);

    final db = await _tileCache.db;

    final nodeRows = await db.rawQuery('SELECT id, lat, lon FROM nodes');
    final nodes = <int, LatLng>{};
    for (final row in nodeRows) {
      final id = row['id'] as int;
      final lat = row['lat'] as double;
      final lon = row['lon'] as double;
      nodes[id] = LatLng(lat, lon);
    }

    final edgeRows = await db.rawQuery('SELECT u, v, length, geometry FROM edges');
    final adjacency = <int, List<Edge>>{};
    for (final row in edgeRows) {
      final u = row['u'] as int;
      final v = row['v'] as int;
      final length = row['length'] as double;
      final geomStr = row['geometry'] as String;

      final points = <LatLng>[];
      for (final pair in geomStr.split(';')) {
        final parts = pair.split(',');
        if (parts.length == 2) {
          final plat = double.tryParse(parts[0]) ?? 0;
          final plon = double.tryParse(parts[1]) ?? 0;
          points.add(LatLng(plat, plon));
        }
      }

      adjacency.putIfAbsent(u, () => []).add(
            Edge(targetNodeId: v, lengthMeters: length, geometry: points),
          );
      adjacency.putIfAbsent(v, () => []).add(
            Edge(targetNodeId: u, lengthMeters: length, geometry: points.reversed.toList()),
          );
    }

    final router = DijkstraRouter(nodes: nodes, adjacency: adjacency);
    return router.route(from, to);
  }
}
