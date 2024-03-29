import 'dart:convert';
import 'package:flutter_trail/models/business.dart';

import '/src/requestor.dart';

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
  List<Business>? businesses;
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
      this.businesses,
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
      required this.isConfirmed});
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
    var businesses =
        Business.static().mapJSON(data['businesses'] as List<dynamic>? ?? []);
    var mobile = utf8.encode(data['mobile'] as String);
    var isConfirmed = data['is-confirmed'] as bool? ?? false;
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

  Map<String, dynamic> toJSON() => {
        "id": id,
        "firstname": firstname,
        "middlename": middlename,
        "lastname": lastname,
        "tax-id": taxID,
        "username": username,
        "email": email,
        "password": password,
        "role": role,
        "photo-url": photoURL,
        "businesses": businesses!.map((e) => e.toJSON()).toList(),
        "mobile": mobile,
        "is-confirmed": isConfirmed
      };

  List<User> mapJSON(List<dynamic> json) {
    return json.map((e) => User.fromJSON(e)).toList();
  }

  Future<List<User>> fetchAssets(String filename) async {
    try {
      List<dynamic> json = await Requestor().arrayFromAssets(filename);
      return json.map((e) => User.fromJSON(e)).toList();
    } catch (e) {
      throw e.toString();
    }
  }

  factory User.static() {
    return User.__();
  }
}
