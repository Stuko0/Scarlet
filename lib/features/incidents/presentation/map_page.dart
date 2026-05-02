import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data/incidents_repository_impl.dart';
import '../domain/fire_entity.dart';

/// Mapbox access token
final String _mapboxToken = dotenv.env['MAPBOX_TOKEN'] ?? '';

/// Dark tactical tile URL for Mapbox
String _tileUrl(String token) =>
    'https://api.mapbox.com/styles/v1/mapbox/dark-v11/tiles/{z}/{x}/{y}@2x?access_token=$token';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  final MapController _mapController = MapController();
  LatLng _currentLocation = const LatLng(-17.413977, -66.165321); // Cochabamba
  List<Fire> _fires = [];
  bool _isLoading = false;
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _loadFires();
    _refreshTimer = Timer.periodic(
      const Duration(minutes: 30),
      (_) => _loadFires(),
    );
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    _mapController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    if (await Permission.location.request().isGranted) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        setState(() {
          _currentLocation = LatLng(position.latitude, position.longitude);
        });
        _mapController.move(_currentLocation, 10);
      } catch (e) {
        debugPrint('Error getting location: $e');
      }
    }
  }

  Future<void> _loadFires() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    try {
      final repo = ref.read(incidentsRepositoryProvider);
      final fires = await repo.getActiveFires();
      setState(() => _fires = fires);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error cargando incendios: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  double _parseConfidence(String confidenceStr) {
    if (confidenceStr.isEmpty) return 0.0;
    if (confidenceStr.toLowerCase() == 'h') return 100.0;
    if (confidenceStr.toLowerCase() == 'n') return 60.0;
    if (confidenceStr.toLowerCase() == 'l') return 30.0;
    return double.tryParse(confidenceStr) ?? 0.0;
  }

  Color _getFireColor(double confidence) {
    if (confidence > 75) return const Color(0xFFE74C3C);
    if (confidence > 50) return const Color(0xFFF39C12);
    return const Color(0xFF3498DB);
  }

  String _getRiskLabel(double confidence) {
    if (confidence > 75) return 'ALTO';
    if (confidence > 50) return 'MEDIO';
    if (confidence > 0) return 'BAJO';
    return 'DESCONOCIDO';
  }

  void _showFireDetails(Fire fire) {
    final double confidenceNum = _parseConfidence(fire.confidence);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Color(0xFF1E1E1E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Fire name
            Text(
              fire.eventId.isNotEmpty ? 'Incendio: ${fire.eventId}' : 'Incendio Detectado',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'DM Sans',
              ),
            ),
            const SizedBox(height: 12),
            // Risk badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _getFireColor(confidenceNum),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Riesgo: ${_getRiskLabel(confidenceNum)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Coordinates
            Text(
              'Lat: ${fire.latitude}, Lng: ${fire.longitude}',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 13,
                fontFamily: 'DM Sans',
              ),
            ),
            Text(
              'Confianza: ${fire.confidence}%',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 13,
                fontFamily: 'DM Sans',
              ),
            ),
            if (fire.frp > 0) ...[
              const SizedBox(height: 4),
              Text(
                'FRP: ${fire.frp} MW',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 13,
                  fontFamily: 'DM Sans',
                ),
              ),
            ],
            if (fire.satellite.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                'Satélite: ${fire.satellite}',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 13,
                  fontFamily: 'DM Sans',
                ),
              ),
            ],
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentLocation,
              initialZoom: 5.5,
            ),
            children: [
              // Mapbox dark tiles
              TileLayer(
                urlTemplate: _tileUrl(_mapboxToken),
                userAgentPackageName: 'com.scarlet.app',
                maxZoom: 19,
                retinaMode: true,
              ),

              // Fire markers
              MarkerLayer(
                markers: _fires.map((fire) {
                  final lat = fire.latitude;
                  final lng = fire.longitude;
                  final confidence = _parseConfidence(fire.confidence);

                  return Marker(
                    point: LatLng(lat, lng),
                    width: 40,
                    height: 40,
                    child: GestureDetector(
                      onTap: () => _showFireDetails(fire),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getFireColor(confidence).withAlpha(180),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: _getFireColor(confidence).withAlpha(100),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.local_fire_department,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              // User location marker
              MarkerLayer(
                markers: [
                  Marker(
                    point: _currentLocation,
                    width: 20,
                    height: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF3498DB),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Loading indicator
          if (_isLoading) const Center(child: CircularProgressIndicator()),

          // Top status bar overlay
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E).withAlpha(200),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2ECC71),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${_fires.length} incendios activos',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // FABs
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'refresh',
            mini: true,
            backgroundColor: const Color(0xFF1E1E1E),
            child: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _loadFires,
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'gps',
            mini: true,
            backgroundColor: const Color(0xFF1E1E1E),
            child: const Icon(Icons.gps_fixed, color: Colors.white),
            onPressed: _getCurrentLocation,
          ),
        ],
      ),
    );
  }
}
