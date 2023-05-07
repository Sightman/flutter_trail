import 'dart:convert';

import 'package:flutter_trail/src/requestor.dart';

class Review {
  int id = 0;
  String fullname = "";
  String? adscription = "";
  String? comment = "";
  String? photoURL =
      "https://cdn4.iconfinder.com/data/icons/glyphs/24/icons_user2-256.png";
  Review(
      {required this.id,
      required this.fullname,
      String? adscription,
      String? comment,
      String? photoURL});
  Review._(
      {required this.id,
      required this.fullname,
      this.adscription,
      this.comment,
      this.photoURL});
  Review.__();

  factory Review.fromJSON(Map<String, dynamic> data) {
    var id = data['id'] as int;
    if (id.isNaN) {
      throw UnsupportedError('Invalid data: $data -> "id" is not a number');
    } else if (id.isNegative) {
      throw UnimplementedError(
          'Invalid data: $data -> "id" cannot be negative');
    }
    var fullname = utf8.encode(data['fullname'] as String);
    var adscription = utf8.encode(data['adscription'] as String? ?? '');
    var comment = utf8.encode(data['comment'] as String? ?? '');
    var photoURL = utf8.encode(data['photo-url'] as String? ??
        'https://cdn4.iconfinder.com/data/icons/glyphs/24/icons_user2-256.png');
    return Review._(
        id: id,
        fullname: utf8.decode(fullname),
        adscription: utf8.decode(adscription),
        comment: utf8.decode(comment),
        photoURL: utf8.decode(photoURL));
  }

  List<Review> mapJSON(List<dynamic> json) {
    return json.map((e) => Review.fromJSON(e)).toList();
  }

  Future<List<Review>> fetchAssets(String filename) async {
    List<dynamic> json = await Requestor().arrayFromAssets(filename);
    return json.map((e) => Review.fromJSON(e)).toList();
  }

  factory Review.static() {
    return Review.__();
  }
}
