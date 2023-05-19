import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_trail/models/business.dart';
import 'package:flutter_trail/src/requestor.dart';

class User {
  int id = 0;
  String firstname = "";
  String? middlename = "";
  String lastname = "";
  String username = "";
  String? taxID = "";
  String email = "";
  String password = "";
  int? role = 0;
  String? photoURL =
      'https://cdn4.iconfinder.com/data/icons/glyphs/24/icons_user2-256.png';
  String mobile = '';
  List<Business>? businesses = [];
  bool? isConfirmed = false;
  User(
      {required this.id,
      required this.firstname,
      this.middlename,
      required this.lastname,
      required this.username,
      this.taxID,
      required this.email,
      required this.password,
      this.role,
      this.photoURL,
      required this.businesses,
      required this.mobile,
      this.isConfirmed});
  User._(
      {required this.id,
      required this.firstname,
      this.middlename,
      required this.lastname,
      required this.username,
      this.taxID = '',
      required this.email,
      required this.password,
      this.role,
      this.photoURL,
      this.businesses,
      required this.mobile,
      this.isConfirmed});
  User.__();

  factory User.fromJSON(Map<String, dynamic> data) {
    var id = data['id'] as int;
    if (id.isNaN) {
      throw UnsupportedError('Invalid data: $data -> "id" is not a number');
    } else if (id.isNegative) {
      throw UnimplementedError(
          'Invalid data: $data -> "id" cannot be negative');
    }
    var firstname = utf8.encode(data['firstname'] as String);
    var middlename = utf8.encode(data['middlename'] as String? ?? '');
    var lastname = utf8.encode(data['lastname'] as String);
    var username = utf8.encode(data['username'] as String);
    var taxID = utf8.encode(data['tid'] as String? ?? '');
    var email = utf8.encode(data['email'] as String);
    var password = utf8.encode(data['password'] as String);
    var role = data['role'] as int? ?? 0;
    var photoURL = utf8.encode(data['photo-url'] as String? ??
        'https://cdn4.iconfinder.com/data/icons/glyphs/24/icons_user2-256.png');
    var businesses = data['businesses'] as List<Business>? ?? [];
    var mobile = utf8.encode(data['mobile'] as String);
    var isConfirmed = data['is-confirmed'] as bool;
    return User._(
        id: id,
        firstname: utf8.decode(firstname),
        middlename: utf8.decode(middlename),
        lastname: utf8.decode(lastname),
        username: utf8.decode(username),
        taxID: utf8.decode(taxID),
        email: utf8.decode(email),
        password: utf8.decode(password),
        role: role,
        photoURL: utf8.decode(photoURL),
        businesses: businesses,
        mobile: utf8.decode(mobile),
        isConfirmed: isConfirmed);
  }

  List<User> mapJSON(List<dynamic> json) {
    return json.map((e) => User.fromJSON(e)).toList();
  }

  Future<List<User>> fetchAssets(String filename) async {
    List<dynamic> json = await Requestor().arrayFromAssets(filename);
    return json.map((e) => User.fromJSON(e)).toList();
  }

  factory User.static() {
    return User.__();
  }
}
