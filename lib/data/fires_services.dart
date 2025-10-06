import 'dart:convert';

import 'package:http/http.dart' as http;

class FireApiService {
  final String apiUrl ="https://eagle-conflicts-soul-guest.trycloudflare.com";

  Future<List<dynamic>> getActiveFires() async {
    try {
      final url = '$apiUrl/nrt.v1.NRTService/GetActiveFires';
      
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Connect-Protocol-Version': '1',
        },
        body: jsonEncode({}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['wildfires'] ?? [];
      } else {
        final errorBody = jsonDecode(response.body);
        throw Exception(errorBody['message'] ?? 'Error al obtener incendios');
      }
    } catch (e) {
      print('Error de conexión: $e');
      throw Exception('Error de conexión: $e');
    }
  }

  // Obtener incendios cercanos
  Future<List<dynamic>> getNearbyFires(double lat, double lng, int radiusKm) async {
    try {
      final url = '$apiUrl/nrt.v1.NRTService/GetNearbyFires';
      
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Connect-Protocol-Version': '1',
        },
        body: jsonEncode({
          "location": {
            "type": "Point",
            "coordinates": [lat, lng]
          },
          "radiusKm": radiusKm
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['wildfires'] ?? [];
      } else {
        final errorBody = jsonDecode(response.body);
        throw Exception(errorBody['message'] ?? 'Error al obtener incendios cercanos');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}