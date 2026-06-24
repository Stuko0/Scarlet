class TileKey {
  final double south;
  final double west;
  static const tileSize = 0.5;

  const TileKey({required this.south, required this.west});

  factory TileKey.fromLocation(double lat, double lon) {
    final s = (lat / tileSize).floorToDouble() * tileSize;
    final w = (lon / tileSize).floorToDouble() * tileSize;
    return TileKey(south: s, west: w);
  }

  String get fileName {
    final latAbs = south.abs().toStringAsFixed(1);
    final lonAbs = west.abs().toStringAsFixed(1);
    final latPrefix = south >= 0 ? 'n' : 's';
    final lonPrefix = west >= 0 ? 'e' : 'w';
    return '$latPrefix$latAbs$lonPrefix$lonAbs.db';
  }

  List<TileKey> neighbors() {
    return [
      TileKey(south: south - tileSize, west: west),
      TileKey(south: south + tileSize, west: west),
      TileKey(south: south, west: west - tileSize),
      TileKey(south: south, west: west + tileSize),
      TileKey(south: south - tileSize, west: west - tileSize),
      TileKey(south: south - tileSize, west: west + tileSize),
      TileKey(south: south + tileSize, west: west - tileSize),
      TileKey(south: south + tileSize, west: west + tileSize),
    ];
  }
}
