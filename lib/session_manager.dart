import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import '/models/user.dart';

class SessionManager {
  static const String _sessionPath = 'test/session.json';
  Future<Map<String, dynamic>> _getSessionData() async {
    try {
      final sessionData = await rootBundle.loadString(_sessionPath);
      return jsonDecode(sessionData);
    } catch (e) {
      return {"exception": e.toString()};
    }
  }

  Future<bool> validateSession() async {
    try {
      final jsonSession = await _getSessionData();
      User user = User.fromJSON(jsonSession);
      if (user.username.isNotEmpty && user.password.isNotEmpty) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<User> login(String username, String email, String password) async {
    try {
      final jsonUsers = await User.static().fetchAssets('test/users.json');
      User? user;
      for (User e in jsonUsers) {
        if (e.username == username ||
            e.email == email && e.password == password) {
          user = User(
              id: e.id,
              firstname: e.firstname,
              lastname: e.lastname,
              username: e.username,
              email: e.email,
              password: e.password,
              businesses: e.businesses,
              mobile: e.mobile,
              isConfirmed: e.isConfirmed,
              role: e.role);
          break;
        }
      }
      File(_sessionPath).writeAsString(jsonEncode(user!.toJSON()));
      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User> loggedUser() async {
    try {
      final jsonSession = await _getSessionData();
      User user = User.fromJSON(jsonSession);
      return user;
    } catch (e) {
      throw (e.toString());
    }
  }
}
