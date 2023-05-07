import 'dart:convert';

class Business {
  int id = 0;
  String name = '';
  String brand = "";
  String taxID = "";
  String slogan = "";
  String tagLine = "";
  String oneLiner = "";
  String logoURL =
      'https://my.alvyss.com/api/v1/cloudron/avatar?2395601373707481';
  String industry = '';
  Business(
      {required this.id,
      required this.name,
      String? brand,
      String? taxID,
      String? slogan,
      String? tagLine,
      String? oneLiner,
      String? logoURL,
      required this.industry});
  Business.fromJSON(Map<String, dynamic> data) {
    id = data['id'] as int;
    if (id.isNaN) {
      throw UnsupportedError('Invalid data: $data -> "id" is not a number');
    } else if (id.isNegative) {
      throw UnimplementedError(
          'Invalid data: $data -> "id" cannot be negative');
    }
    name = utf8.decode(utf8.encode(data['name'] as String));
    brand = utf8.decode(utf8.encode(data['brand'] as String? ?? ''));
    taxID = utf8.decode(utf8.encode(data['tid'] as String? ?? ''));
    slogan = utf8.decode(utf8.encode(data['slogan'] as String? ?? ''));
    tagLine = utf8.decode(utf8.encode(data['tag-line'] as String? ?? ''));
    oneLiner = utf8.decode(utf8.encode(data['one-liner'] as String? ?? ''));
    logoURL = utf8.decode(utf8.encode(data['logo-url'] as String? ?? ''));
    industry = utf8.decode(utf8.encode(data['industry'] as String));
  }
}
