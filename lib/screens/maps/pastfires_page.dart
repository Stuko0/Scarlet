import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scarlet_app/data/fires_services.dart';
import 'package:scarlet_app/widgets/modal.dart';

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
    _getFires();
  }

  _getFires() async {
    var response = await fires.getFires();
    if (response.statusCode == 200) {
      List<dynamic> fires = jsonDecode(response.body);
      setState(() {
        _markers = fires
            .map((fire) => Marker(
                  markerId: MarkerId(fire['id'].toString()),
                  position: LatLng(fire['latitude'], fire['longitude']),
                  onTap: (){
                    double screenHeight = MediaQuery.of(context).size.height;
                    String minTeams = "1";
                    String maxTeams = "5";
                    String risky = "PROMEDIO";
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      context: context,
                      builder: (context) => GestureDetector(
                        onVerticalDragEnd: (details) {
                          if(details.primaryVelocity! < 0){
                            // TODO mandar a ubicacion
                          }else{Navigator.pop(context);}
                        },
                        child: CustomModal(width: 327, height: screenHeight*0.5, picture: "https://picsum.photos/1920", images: const ["https://picsum.photos/1920","https://picsum.photos/1920","https://picsum.photos/1920"], name: "Wildfire", address: "Alguna Parte", features: ["D: ${fire['acq_date']}","H: ${fire['acq_time']}","D/N: ${fire['daynight']}",], maxTeams: maxTeams, minTeams: minTeams, risky: risky,),
                      )
                    );
                  }
                ))
            .toSet();
      });
    }
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
