import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:latlong2/latlong.dart';
import '../domain/route_entity.dart';

class Edge {
  final int targetNodeId;
  final double lengthMeters;
  final List<LatLng> geometry;

  const Edge({
    required this.targetNodeId,
    required this.lengthMeters,
    required this.geometry,
  });
}

class DijkstraRouter {
  final Map<int, LatLng> _nodes;
  final Map<int, List<Edge>> _adjacency;

  DijkstraRouter({
    required Map<int, LatLng> nodes,
    required Map<int, List<Edge>> adjacency,
  })  : _nodes = nodes,
        _adjacency = adjacency;

  int nearestNode(LatLng point) {
    var nearestId = -1;
    var bestDistance = double.infinity;
    const distance = Distance();

    for (final entry in _nodes.entries) {
      final d = distance.as(LengthUnit.Meter, point, entry.value);
      if (d < bestDistance) {
        bestDistance = d;
        nearestId = entry.key;
      }
    }

    return nearestId;
  }

  Route route(LatLng from, LatLng to) {
    final startId = nearestNode(from);
    final endId = nearestNode(to);

    if (startId == -1 || endId == -1) {
      throw Exception('No se encontró un nodo cercano en el grafo vial.');
    }

    final dist = <int, double>{startId: 0};
    final prev = <int, int>{};
    final prevEdge = <int, Edge>{};
    final visited = <int>{};
    final queue =
        HeapPriorityQueue<int>((a, b) => dist[a]!.compareTo(dist[b]!));
    queue.add(startId);

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();
      if (current == endId) break;
      if (visited.contains(current)) continue;
      visited.add(current);

      for (final edge in _adjacency[current] ?? []) {
        final next = edge.targetNodeId;
        final newDist = dist[current]! + edge.lengthMeters;
        if (newDist < (dist[next] ?? double.infinity)) {
          dist[next] = newDist;
          prev[next] = current;
          prevEdge[next] = edge;
          queue.add(next);
        }
      }
    }

    if (!dist.containsKey(endId)) {
      throw Exception('No existe ruta vial entre los puntos seleccionados.');
    }

    final pathPoints = <LatLng>[];
    var current = endId;
    while (current != startId) {
      final edge = prevEdge[current]!;
      pathPoints.insertAll(0, edge.geometry);
      current = prev[current]!;
    }
    pathPoints.insert(0, _nodes[startId]!);

    final durationSeconds = dist[endId]! / 1.2;

    return Route(
      points: pathPoints,
      distanceMeters: dist[endId]!,
      durationSeconds: durationSeconds,
    );
  }
}
