import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scarlet_app/data/fires_services.dart';
import 'package:scarlet_app/widgets/modal.dart';

class RealTimePage extends StatefulWidget {
  const RealTimePage({super.key});

  @override
  State<RealTimePage> createState() => _RealTimePageState();
}

class _RealTimePageState extends State<RealTimePage> {
  late GoogleMapController mapController;
  late LatLng ubi = const LatLng(-17.413977, -66.165321);
  Set<Marker> _markers = {};
  final FireApiService _apiService = FireApiService();
  Timer? _refreshTimer;
  bool _isLoading = false;
  late BitmapDescriptor fireNormalIcon;
  late BitmapDescriptor fireMidIcon;
  late BitmapDescriptor fireHighIcon;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _loadFires();
    _setupAutoRefresh();
    _loadCustomIcons();
  }

  Future<void> _loadCustomIcons() async {
    fireNormalIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/img/icons/fire-normal.png',
    );
    fireMidIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/img/icons/fire-mid.png',
    );
    fireHighIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/img/icons/fire-high.png',
    );
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  void _setupAutoRefresh() {
    _refreshTimer = Timer.periodic(const Duration(minutes: 30), (timer) {
      _loadFires();
    });
  }

  Future<void> _loadFires() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    try {
      final fires = await _apiService.getActiveFires();
      _updateMarkers(fires);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _updateMarkers(List<dynamic> fires) {
    setState(() {
      _markers = fires.map((fire) {
        final coords = fire['location']['coordinates'];
        return Marker(
          markerId: MarkerId(fire['fireId'] ?? UniqueKey().toString()),
          position: LatLng(coords[1], coords[0]),
          icon: _getCustomMarkerIcon(fire['confidence'] ?? 0.0),
          onTap: () => _showFireDetails(fire),
        );
      }).toSet();
    });
  }

  BitmapDescriptor _getCustomMarkerIcon(double confidence) {
    if (confidence > 75) return fireHighIcon;
    if (confidence > 50) return fireMidIcon;
    return fireNormalIcon;
  }

  void _showFireDetails(Map<String, dynamic> fire) {
    final coords = fire['location']['coordinates'];
    final screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) => GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            mapController.animateCamera(
              CameraUpdate.newLatLng(
                LatLng(coords[1], coords[0]),
              ),
            );
          } else {
            Navigator.pop(context);
          }
        },
        child: CustomModal(
          width: 327,
          height: screenHeight * 0.5,
          picture: fire['metadata']['imageUrl'] ?? "https://picsum.photos/1920",
          images: const [
            "https://picsum.photos/1920",
            "https://picsum.photos/1920",
            "https://picsum.photos/1920"
          ],
          name: fire['name'] ?? "Incendio forestal",          
          address: fire['metadata']['location'] ?? "Ubicación desconocida",
          features: [
            "PRF: ${fire['metadata']['frp']?? 'Posible Falsa Alarma'}%",
            "Velocidad del Viento: ${fire['weather']['windSpeed']?? 'Desconocida'}",
            "Temperatura: ${fire['weather']['temperature']?? 'Desconocida'}",
            "Humedad: ${fire['weather']['humidity']?? 'Desconocida'}",
          ],
          maxTeams: "5",
          minTeams: "1",
          risky: _getRiskLevel(fire),
        ),
      ),
    );
  }

  String _getRiskLevel(Map<String, dynamic> fire) {
    final confidence = fire['confidence'] ?? 0;
    if (confidence > 75) return "ALTO";
    if (confidence > 50) return "MEDIO";
    return "BAJO";
  }

  _getCurrentLocation() async {
    if (await Permission.location.request().isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        ubi = LatLng(position.latitude, position.longitude);
      });
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: ubi,
            zoom: 10.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            key: Key('fire_map'),
            onMapCreated: (controller) => mapController = controller,
            initialCameraPosition: CameraPosition(target: ubi, zoom: 8),
            markers: _markers,
            myLocationEnabled: true,
          ),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'refresh',
            mini: true,
            child: const Icon(Icons.refresh),
            onPressed: _loadFires,
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'gps',
            mini: true,
            child: const Icon(Icons.gps_fixed),
            onPressed: _getCurrentLocation,
          ),
        ],
      ),
    );
  }
}
