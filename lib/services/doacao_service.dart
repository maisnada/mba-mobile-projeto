import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:proj_bootcamp_2/services/session_repository.dart';

class DoacaoService {
  final String _baseUrl = "http://192.168.1.5:3000/users";

  final _ssesion = SessionRepository();

  Future<List<dynamic>> getList() async {
    dynamic logged = await _ssesion.getLoggedUser();

    String token = logged['token'];

    Uri uri = Uri.parse('$_baseUrl');

    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      throw HttpException(response.body, uri: uri);
    }

    print('Erro: ${response.body}');

    return [];
  }

  Future<dynamic?> adicionar(
      String alimento, String tipo, String dataPreparo) async {
    dynamic logged = await _ssesion.getLoggedUser();

    String token = logged['token'];

    final response = await http.post(
      Uri.parse('$_baseUrl'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: jsonEncode(
          {"alimento": alimento, "tipo": tipo, "dataPreparo": dataPreparo}),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
