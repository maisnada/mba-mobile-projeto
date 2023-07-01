import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class SessionRepository {
  final LocalStorage _storage = LocalStorage("session.json");
  final String _key = 'LOGGED_USER';

  Future<void> setLoggedUser(dynamic user) async {
    await _storage.setItem(_key, user);
  }

  Future<dynamic> getLoggedUser() async {
    return await _storage.getItem(_key);
  }

  Future<void> removeLoggedUser() async {
    await _storage.deleteItem(_key);
  }
}
