import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = "https://eagle-conflicts-soul-guest.trycloudflare.com";

  Future<Map<String, dynamic>> createUserByEmail({
    required String name,
    required String lastname,
    required String email,
    required String password,
  }) async {
    try {
      final url = '$_baseUrl/user.v1.UserService/CreateUserByEmail';
      
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Connect-Protocol-Version': '1',
        },
        body: jsonEncode({
          "name": name,
          "lastname": lastname,
          "email": email,
          "password": password,
          "origin": "app",
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        final errorBody = jsonDecode(response.body);
        throw Exception(errorBody['message'] ?? 'Error en el registro');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  Future<Map<String, dynamic>> loginByEmail({
    required String email,
    required String password,
  }) async {
    try {
      final url = '$_baseUrl/user.v1.UserService/LoginByEmail';
      
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Connect-Protocol-Version': '1',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      final responseData = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        // Normalización de datos
        final userData = responseData['user'] as Map<String, dynamic>? ?? {};
        return {
          'token': responseData['token'] as String? ?? '',
          'user': {
            'userId': userData['userId']?.toString(),
            'name': userData['name'] as String? ?? '',
            'email': userData['email'] as String? ?? '',
            'role': userData['role'] as String? ?? 'user',
          }
        };
      } else {
        throw Exception(responseData['message'] ?? 'Error en el login (${response.statusCode})');
      }
    } on FormatException catch (e) {
      throw Exception('Error al procesar la respuesta del servidor');
    } catch (e) {
      throw Exception('Error de conexión: ${e.toString()}');
    }
  }

  Future<bool> checkEmailExists(String email)async{
    try{
      final url ='$_baseUrl/user.v1.UserService/GetUserByEmail';
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type':'application/json',
          'Connect-Protocol-Version': '1'
        },
        body: jsonEncode({"email":email})
      );
      return response.statusCode==200;
    }catch(e){return false;}
  }

  Future<Map<String, dynamic>> getUser(int userId) async {
    final url = '$_baseUrl/user.v1.UserService/GetUser';
    
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Connect-Protocol-Version': '1',
      },
      body: jsonEncode({
        "user_id": userId,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user: ${response.statusCode}');
    }
  }
}