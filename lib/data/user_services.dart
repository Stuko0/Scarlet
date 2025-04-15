import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _apiUrl ="https://0hl39814.brs.devtunnels.ms:8000/users"; //usar el link generado por devtunnels, DEBE PERMITIR ANONIMOS =B5VF'.?5x5*S#M || mahayo8987@dwriters.com

  Future<http.Response> getByEmail(String email) async {
    final response = await http.post(
      Uri.parse("$_apiUrl/getUserByEmail"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'email': email}),
    );
    return response;
  }

  Future<http.Response> checkLogin(String email, String password) async {
    final response = await http.post(
      Uri.parse("$_apiUrl/checkLogin"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'email': email, 'password': password}),
    );

    return response;
  }

  Future<http.Response> registerUser(
      String firstName, String lastName, String email, String password) async {
    final response = await http.post(
      Uri.parse("$_apiUrl/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'name': firstName,
        'lastname': lastName,
        'email': email,
        'psw': password
      }),
    );
    return response;
  }

  Future<String> sendPhoneCode(String phone) async {
    final response = await http.post(
      Uri.parse("$_apiUrl/sendPhoneCode"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'phone': phone}),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['otp_id'];
    } else {
      throw Exception('Failed to send phone code');
    }
  }

  Future<http.Response> verifyPhoneCode(String otpId, String code) async {
    final response = await http.post(
      Uri.parse("$_apiUrl/verifyPhoneCode"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'otp_id': otpId, 'otp_code': code}),
    );
    return response;
  }

  Future<http.Response> getUserByPhone(String phone) async {
    final response = await http.post(
      Uri.parse("$_apiUrl/getUserByPhone"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'phone': phone}),
    );

    return response;
  }

  Future<http.Response> registerByPhoneNumber(
      String firstName, String lastName, String email, String phone) async {
    final response = await http.post(
      Uri.parse("$_apiUrl/registerUserByPhoneNumber"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'name': firstName,
        'lastname': lastName,
        'email': email,
        'phone': phone,
      }),
    );

    return response;
  }

  Future<http.Response> getUserById(int? id) async {
    final response = await http.post(
      Uri.parse("$_apiUrl/getUserById"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'id': id}),
    );

    return response;
  }
}
