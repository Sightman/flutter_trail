import 'dart:convert';

import 'package:flutter_trail/models/user.dart';

import '/src/requestor.dart';

class Business {
  int id = 0;
  String name = "";
  String? brand = "";
  String? taxID = "";
  String? slogan = "";
  String? tagLine = "";
  String? oneLiner = "";
  String? logoURL =
      'https://my.alvyss.com/api/v1/cloudron/avatar?2395601373707481';
  String? industry = "";
  User? owner;
  Business(
      {required this.id,
      required this.name,
      String? brand,
      String? taxID,
      String? slogan,
      String? tagLine,
      String? oneLiner,
      String? logoURL,
      String? industry,
      required this.owner});
  Business._(
      {required this.id,
      required this.name,
      this.brand = '',
      this.taxID = '',
      this.slogan = '',
      this.tagLine = '',
      this.oneLiner = '',
      this.logoURL,
      this.industry,
      required this.owner});
  Business.__();

  factory Business.fromJSON(Map<String, dynamic> data) {
    var id = data['id'] as int;
    if (id.isNaN) {
      throw UnsupportedError('Invalid data: $data -> "id" is not a number');
    } else if (id.isNegative) {
      throw UnimplementedError(
          'Invalid data: $data -> "id" cannot be negative');
    }
    var name = utf8.encode(data['name'] as String);
    var brand = utf8.encode(data['brand'] as String? ?? '');
    var taxID = utf8.encode(data['tid'] as String? ?? '');
    var slogan = utf8.encode(data['slogan'] as String? ?? '');
    var tagLine = utf8.encode(data['tag-line'] as String? ?? '');
    var oneLiner = utf8.encode(data['one-liner'] as String? ?? '');
    var logoURL = utf8.encode(data['logo-url'] as String? ??
        'https://my.alvyss.com/api/v1/cloudron/avatar?2395601373707481');
    var industry = utf8.encode(data['industry'] as String? ?? '');
    var owner = User.fromJSON(data['owner'] ?? {});
    return Business._(
        id: id,
        name: utf8.decode(name),
        brand: utf8.decode(brand),
        taxID: utf8.decode(taxID),
        slogan: utf8.decode(slogan),
        tagLine: utf8.decode(tagLine),
        oneLiner: utf8.decode(oneLiner),
        logoURL: utf8.decode(logoURL),
        industry: utf8.decode(industry),
        owner: owner);
  }

  Map<String, dynamic> toJSON() => {
        "id": id,
        "name": name,
        "brand": brand,
        "tax-id": taxID,
        "slogan": slogan,
        "tag-line": tagLine,
        "one-liner": oneLiner,
        "logo-url": logoURL,
        "industry": industry,
        "owner": owner!.toJSON()
      };

  List<Business> mapJSON(List<dynamic> json) {
    return json.map((e) => Business.fromJSON(e)).toList();
  }

  Future<List<Business>> fetchAssets(String filename) async {
    try {
      List<dynamic> json = await Requestor().arrayFromAssets(filename);
      return json.map((e) => Business.fromJSON(e)).toList();
    } catch (e) {
      return [];
    }
  }

  factory Business.static() {
    return Business.__();
  }
}
