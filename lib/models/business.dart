import 'dart:convert';

class Business {
  final int id;
  final String name;
  final String brand = "";
  final String taxID = "";
  final String slogan = "";
  final String tagLine = "";
  final String oneLiner = "";
  final String logoURL =
      'https://my.alvyss.com/api/v1/cloudron/avatar?2395601373707481';
  final String industry;
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
  factory Business.fromJSON(Map<String, dynamic> data) {
    final id = data['id'] as int;
    if (id.isNaN) {
      throw UnsupportedError('Invalid data: $data -> "id" is not a number');
    } else if (id.isNegative) {
      throw UnimplementedError(
          'Invalid data: $data -> "id" cannot be negative');
    }
    final name = utf8.encode(data['name'] as String);
    final brand = utf8.encode(data['brand'] as String? ?? '');
    final taxID = utf8.encode(data['tid'] as String? ?? '');
    final slogan = utf8.encode(data['slogan'] as String? ?? '');
    final tagLine = utf8.encode(data['tag-line'] as String? ?? '');
    final oneLiner = utf8.encode(data['one-liner'] as String? ?? '');
    final logoURL = utf8.encode(data['logo-url'] as String? ?? '');
    final industry = utf8.encode(data['industry'] as String);
    return Business(
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
}
