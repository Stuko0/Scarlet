import 'package:flutter_test/flutter_test.dart';
import 'package:scarlet_app/features/routing/domain/tile_key.dart';

void main() {
  group('TileKey', () {
    test('fromLocation computes correct grid for negative coords', () {
      final key = TileKey.fromLocation(-17.4, -66.1);
      expect(key.south, -17.5);
      expect(key.west, -66.5);
    });

    test('fromLocation computes correct grid for positive coords', () {
      final key = TileKey.fromLocation(5.3, 72.8);
      expect(key.south, 5.0);
      expect(key.west, 72.5);
    });

    test('fileName formats correctly for southern/western hemisphere', () {
      final key = TileKey(south: -17.5, west: -66.5);
      expect(key.fileName, 's17.5_w66.5.db');
    });

    test('fileName formats correctly for northern/eastern hemisphere', () {
      final key = TileKey(south: 5.0, west: 72.5);
      expect(key.fileName, 'n5.0_e72.5.db');
    });

    test('neighbors returns 8 adjacent tiles', () {
      final key = TileKey(south: -17.5, west: -66.0);
      final neighbors = key.neighbors();
      expect(neighbors.length, 8);
    });
  });
}
