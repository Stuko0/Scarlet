import 'dart:io';
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../domain/tile_key.dart';

class TileCache {
  final Dio _dio;
  Database? _db;
  static const _baseUrl = 'https://api.stuko.dev/api/v1/routing/tiles';

  TileCache({required Dio dio}) : _dio = dio;

  Future<Database> get db async {
    if (_db != null) return _db!;
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'road_graph.db');
    _db = await openDatabase(path);
    await _db!.execute(
      'CREATE TABLE IF NOT EXISTS nodes (id INTEGER PRIMARY KEY, lat REAL, lon REAL)',
    );
    await _db!.execute(
      'CREATE TABLE IF NOT EXISTS edges (u INTEGER, v INTEGER, length REAL, geometry TEXT)',
    );
    await _db!.execute(
      'CREATE INDEX IF NOT EXISTS idx_edges_u ON edges(u)',
    );
    await _db!.execute(
      'CREATE TABLE IF NOT EXISTS loaded_tiles (tile_key TEXT PRIMARY KEY)',
    );
    return _db!;
  }

  Future<bool> isTileCached(TileKey key) async {
    final database = await db;
    final rows = await database.query(
      'loaded_tiles',
      where: 'tile_key = ?',
      whereArgs: [key.fileName],
    );
    return rows.isNotEmpty;
  }

  Future<void> downloadTile(TileKey key) async {
    if (await isTileCached(key)) return;

    final dir = await getApplicationDocumentsDirectory();
    final tilePath = join(dir.path, key.fileName);

    try {
      await _dio.download('$_baseUrl/${key.fileName}', tilePath);

      final tileDb = await openDatabase(tilePath, readOnly: true);
      final database = await db;

      final nodes = await tileDb.rawQuery('SELECT id, lat, lon FROM nodes');
      for (final node in nodes) {
        await database.rawInsert(
          'INSERT OR IGNORE INTO nodes (id, lat, lon) VALUES (?, ?, ?)',
          [node['id'], node['lat'], node['lon']],
        );
      }

      final edges = await tileDb.rawQuery('SELECT u, v, length, geometry FROM edges');
      for (final edge in edges) {
        await database.rawInsert(
          'INSERT OR IGNORE INTO edges (u, v, length, geometry) VALUES (?, ?, ?, ?)',
          [edge['u'], edge['v'], edge['length'], edge['geometry']],
        );
      }

      await tileDb.close();
      await File(tilePath).delete();

      await database.rawInsert(
        'INSERT OR REPLACE INTO loaded_tiles (tile_key) VALUES (?)',
        [key.fileName],
      );
    } catch (e) {
      if (await File(tilePath).exists()) {
        await File(tilePath).delete();
      }
      rethrow;
    }
  }

  Future<void> ensureTile(TileKey key) async {
    await downloadTile(key);
  }

  Future<void> ensureTilesForRoute(LatLng from, LatLng to) async {
    final minLat = (from.latitude < to.latitude ? from.latitude : to.latitude) - 0.1;
    final maxLat = (from.latitude > to.latitude ? from.latitude : to.latitude) + 0.1;
    final minLon = (from.longitude < to.longitude ? from.longitude : to.longitude) - 0.1;
    final maxLon = (from.longitude > to.longitude ? from.longitude : to.longitude) + 0.1;

    const size = TileKey.tileSize;
    for (double lat = (minLat / size).floorToDouble() * size;
        lat <= maxLat;
        lat += size) {
      for (double lon = (minLon / size).floorToDouble() * size;
          lon <= maxLon;
          lon += size) {
        final key = TileKey(south: lat, west: lon);
        await ensureTile(key);
      }
    }
  }
}
