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
    final name = data['name'] as String;
    final brand = data['brand'] as String?;
    final taxID = data['tid'] as String?;
    final slogan = data['slogan'] as String?;
    final tagLine = data['tag-line'] as String?;
    final oneLiner = data['one-liner'] as String?;
    final logoURL = data['logo-url'] as String?;
    final industry = data['industry'] as String;
    return Business(
        id: id,
        name: name,
        brand: brand,
        taxID: taxID,
        slogan: slogan,
        tagLine: tagLine,
        oneLiner: oneLiner,
        logoURL: logoURL,
        industry: industry);
  }
}
