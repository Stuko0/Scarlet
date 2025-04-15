import 'package:http/http.dart' as http;

class FireApiService {
  final String _apiUrl ="https://0hl39814.brs.devtunnels.ms:8000/"; //usar el link generado por devtunnels, DEBE PERMITIR ANONIMOS

  Future<http.Response> getFires() async {
    final response = await http.get(
      Uri.parse("${_apiUrl}fires"),
      headers: {"Content-Type": "application/json"},
    );
    return response;
  }
  
  Future<http.Response> getRTFires() async {
    final response = await http.get(
      Uri.parse("${_apiUrl}rtfires"),
      headers: {"Content-Type": "application/json"},
    );
    return response;
  }
}