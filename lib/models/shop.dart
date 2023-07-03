import 'dart:convert';

import '../src/requestor.dart';
import 'business.dart';

class Shop {
  int id = 0;
  String name = "";
  String? description = "";
  String? address = "";
  String? neighborhood = "";
  String? town = "";
  String? province = "";
  String? country = "";
  String? zipcode = "";
  String? mapLink = "";
  String? photoURL = "";
  Business? holder;
  Shop(
      {required this.id,
      required this.name,
      description,
      address,
      neighborhood,
      town,
      province,
      country,
      zipcode,
      mapLink,
      photoURL =
          "https://cdn.leonardo.ai/users/11f55013-a852-41dc-8f77-fa6af6fd814a/generations/f353d4e4-041b-4a6c-901c-c5e8c4690558/Leonardo_Select_A_white_mexican_trucker_dinning_two_tortas_aho_0.jpg",
      required this.holder});
  Shop._(
      {required this.id,
      required this.name,
      description,
      address,
      neighborhood,
      town,
      province,
      country,
      zipcode,
      mapLink,
      photoURL,
      required this.holder});
  Shop.__();
  factory Shop.fromJSON(Map<String, dynamic> data) {
    var id = data['id'] as int;
    if (id.isNaN) {
      throw UnsupportedError('Invalid data: $data -> "id" is not a number');
    } else if (id.isNegative) {
      throw UnimplementedError(
          'Invalid data: $data -> "id" cannot be negative');
    }
    var name = utf8.encode(data['name'] as String);
    var description = utf8.encode(data['description'] as String? ?? "");
    var address = utf8.encode(data['address'] as String? ?? "");
    var neighborhood = utf8.encode(data['neighborhood'] as String? ?? "");
    var town = utf8.encode(data['town'] as String? ?? "");
    var province = utf8.encode(data['province'] as String? ?? "");
    var country = utf8.encode(data['country'] as String? ?? "");
    var zipcode = utf8.encode(data['zipcode'] as String? ?? "");
    var mapLink = utf8.encode(data['map-link'] as String? ?? "");
    var photoURL = utf8.encode(data['photo-url'] as String? ??
        "https://cdn.leonardo.ai/users/11f55013-a852-41dc-8f77-fa6af6fd814a/generations/f353d4e4-041b-4a6c-901c-c5e8c4690558/Leonardo_Select_A_white_mexican_trucker_dinning_two_tortas_aho_0.jpg");
    var holder = Business.fromJSON(data['holder'] ?? {});
    return Shop._(
        id: id,
        name: utf8.decode(name),
        description: utf8.decode(description),
        address: utf8.decode(address),
        neighborhood: utf8.decode(neighborhood),
        town: utf8.decode(town),
        province: utf8.decode(province),
        country: utf8.decode(country),
        zipcode: utf8.decode(zipcode),
        mapLink: utf8.decode(mapLink),
        photoURL: utf8.decode(photoURL),
        holder: holder);
  }

  Map<String, dynamic> toJSON() => {
        "id": id,
        "name": name,
        "description": description,
        "address": address,
        "neighborhood": neighborhood,
        "town": town,
        "province": province,
        "country": country,
        "zipcode": zipcode,
        "map-link": mapLink,
        "photo-url": photoURL,
        "holder": holder!.toJSON()
      };

  List<Shop> mapJSON(List<dynamic> json) {
    return json.map((e) => Shop.fromJSON(e)).toList();
  }

  Future<List<Shop>> fetchAssets(String filename) async {
    try {
      List<dynamic> json = await Requestor().arrayFromAssets(filename);
      return json.map((e) => Shop.fromJSON(e)).toList();
    } catch (e) {
      throw e.toString();
    }
  }

  factory Shop.static() {
    return Shop.__();
  }
}
