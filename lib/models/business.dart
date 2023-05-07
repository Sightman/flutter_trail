import 'dart:convert';

import 'package:flutter_trail/src/requestor.dart';

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
  Business(
      {required this.id,
      required this.name,
      String? brand,
      String? taxID,
      String? slogan,
      String? tagLine,
      String? oneLiner,
      String? logoURL,
      String? industry});
  Business._(
      {required this.id,
      required this.name,
      this.brand = '',
      this.taxID = '',
      this.slogan = '',
      this.tagLine = '',
      this.oneLiner = '',
      this.logoURL =
          'https://my.alvyss.com/api/v1/cloudron/avatar?2395601373707481',
      this.industry});
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
    var logoURL = utf8.encode(data['logo-url'] as String? ?? '');
    var industry = utf8.encode(data['industry'] as String? ?? '');
    return Business._(
        id: id,
        name: utf8.decode(name),
        brand: utf8.decode(brand),
        taxID: utf8.decode(taxID),
        slogan: utf8.decode(slogan),
        tagLine: utf8.decode(tagLine),
        oneLiner: utf8.decode(oneLiner),
        logoURL: utf8.decode(logoURL),
        industry: utf8.decode(industry));
  }

  List<Business> mapJSON(List<dynamic> json) {
    return json.map((e) => Business.fromJSON(e)).toList();
  }

  Future<List<Business>> fetchAssets(String filename) async {
    List<dynamic> json = await Requestor().arrayFromAssets(filename);
    return json.map((e) => Business.fromJSON(e)).toList();
  }

  factory Business.static() {
    return Business.__();
  }
}