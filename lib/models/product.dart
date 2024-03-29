import 'dart:convert';

import '../src/requestor.dart';
import 'business.dart';

class Product {
  int id = 0;
  String name = "";
  String? model = "";
  String? brand = "";
  String? dimensionUnit = "";
  String? volumeUnit = "";
  String? weightUnit = "";
  double? width = 0;
  double? height = 0;
  double? length = 0;
  double? volume = 0;
  double? weight = 0;
  double? price = 0;
  String? currency = "MXN";
  String? sku = "";
  double pointsRewarded = 0;
  String? photoURL;
  Business? distributor;
  Product(
      {required this.id,
      required this.name,
      this.model,
      this.brand,
      this.dimensionUnit,
      this.volumeUnit,
      this.weightUnit,
      this.width,
      this.height,
      this.length,
      this.volume,
      this.weight,
      this.price,
      this.currency,
      this.sku,
      required this.pointsRewarded,
      this.photoURL,
      required this.distributor});
  Product._(
      {required this.id,
      required this.name,
      this.model,
      this.brand,
      this.dimensionUnit,
      this.volumeUnit,
      this.weightUnit,
      this.width,
      this.height,
      this.length,
      this.volume,
      this.weight,
      this.price,
      this.currency,
      this.sku,
      required this.pointsRewarded,
      this.photoURL,
      required this.distributor});
  Product.__();
  factory Product.fromJSON(Map<String, dynamic> data) {
    var id = data['id'] as int;
    if (id.isNaN) {
      throw UnsupportedError('Invalid data: $data -> "id" is not a number');
    } else if (id.isNegative) {
      throw UnimplementedError(
          'Invalid data: $data -> "id" cannot be negative');
    }
    var name = utf8.encode(data['name'] as String? ?? "");
    var model = utf8.encode(data['model'] as String? ?? "");
    var brand = utf8.encode(data['brand'] as String? ?? "");
    var dimensionUnit = utf8.encode(data['dimension-unit'] as String? ?? "");
    var volumeUnit = utf8.encode(data['volume-unit'] as String? ?? "");
    var weightUnit = utf8.encode(data['weight-unit'] as String? ?? "");
    var width = data['width'] as double? ?? 0;
    var height = data['height'] as double? ?? 0;
    var length = data['length'] as double? ?? 0;
    var volume = data['volume'] as double? ?? 0;
    var weight = data['weight'] as double? ?? 0;
    var price = data['price'] as double? ?? 0;
    var currency = data['currency'] as String? ?? "MXN";
    var sku = utf8.encode(data['sku'] as String? ?? "");
    var pointsRewarded = data['points-rewarded'] as double? ?? 0;
    var photoURL = utf8.encode(data['photo-url'] as String? ?? "");
    var distributor = Business.fromJSON(data['distributor'] ?? {});
    return Product._(
        id: id,
        name: utf8.decode(name),
        model: utf8.decode(model),
        brand: utf8.decode(brand),
        dimensionUnit: utf8.decode(dimensionUnit),
        volumeUnit: utf8.decode(volumeUnit),
        weightUnit: utf8.decode(weightUnit),
        width: width,
        height: height,
        length: length,
        volume: volume,
        weight: weight,
        price: price,
        currency: currency,
        sku: utf8.decode(sku),
        pointsRewarded: pointsRewarded,
        photoURL: utf8.decode(photoURL),
        distributor: distributor);
  }

  Map<String, dynamic> toJSON() => {
        "id": id,
        "name": name,
        "model": model,
        "brand": brand,
        "dimension-unit": dimensionUnit,
        "volume-unit": volumeUnit,
        "weight-unit": weightUnit,
        "width": width,
        "height": height,
        "length": length,
        "volume": volume,
        "weight": weight,
        "price": price,
        "currency": currency,
        "sku": sku,
        "points-rewarded": pointsRewarded,
        "photo-url": photoURL,
        "distributor": distributor!.toJSON()
      };
  List<Product> mapJSON(List<dynamic> json) {
    return json.map((e) => Product.fromJSON(e)).toList();
  }

  Future<List<Product>> fetchAssets(String filename) async {
    try {
      List<dynamic> json = await Requestor().arrayFromAssets(filename);
      return json.map((e) => Product.fromJSON(e)).toList();
    } catch (e) {
      return [];
    }
  }

  factory Product.static() {
    return Product.__();
  }
}
