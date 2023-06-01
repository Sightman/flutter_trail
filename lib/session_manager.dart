import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import '/models/user.dart';

class SessionManager {
  static const String _sessionPath = 'test/session.json';
  Future<Map<String, dynamic>> _getSessionData() async {
    final sessionData = await rootBundle.loadString(_sessionPath);
    return jsonDecode(sessionData);
  }

  Future<bool> validateSession() async {
    final jsonSession = await _getSessionData();
    User user = User.fromJSON(jsonSession);
    if (user.username.isNotEmpty && user.password.isNotEmpty) {
      return true;
    }
    return false;
  }

  void login(String username, String email, String password) async {
    final jsonUsers = await User.static().fetchAssets('test/users.json');
    final user = jsonUsers
        .map((e) =>
            e.username == username || e.email == email && e.password == password
                ? User(
                    id: e.id,
                    firstname: e.firstname,
                    lastname: e.lastname,
                    username: e.username,
                    email: e.email,
                    password: e.password,
                    businesses: e.businesses,
                    mobile: e.mobile,
                    isConfirmed: e.isConfirmed)
                : null)
        .firstOrNull;
    File(_sessionPath).writeAsString(jsonEncode(user!.toJSON()));
  }
}
