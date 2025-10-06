import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scarlet_app/data/fires_services.dart';

class PastFiresPage extends StatefulWidget {
  const PastFiresPage({super.key});

  @override
  State<PastFiresPage> createState() => _PastFiresPageState();
}

class _PastFiresPageState extends State<PastFiresPage> {
  late GoogleMapController mapController;
  late LatLng ubi = const LatLng(-17.413977,-66.165321);
  Set<Marker> _markers = {};
  final FireApiService fires = FireApiService();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    if (await Permission.location.request().isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      ubi = LatLng(position.latitude, position.longitude);
      setState(() {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: ubi,
              zoom: 8.0,
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GoogleMap(
      onMapCreated: (GoogleMapController controller) async {
        mapController = controller;
        // mapController.setMapStyle(mapTheme);
      },
      initialCameraPosition: CameraPosition(target: ubi, zoom: 6),
      mapToolbarEnabled: false,
      markers: _markers,
    )));
  }
}
