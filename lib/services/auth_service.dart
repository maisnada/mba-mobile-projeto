import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:proj_bootcamp_2/services/session_repository.dart';

class AuthService {
  
  final String _baseUrl = "http://192.168.1.5:3000/auth";

  final _ssesion = SessionRepository();

  Future<dynamic?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 201) {
      dynamic logged = jsonDecode(response.body);

      await _ssesion.setLoggedUser(logged);

      dynamic lu = await _ssesion.getLoggedUser();

      print(lu['token']);

      return logged;
    }

    return null;
  }
}
