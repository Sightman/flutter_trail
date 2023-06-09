import 'package:flutter/material.dart';
import '/themes/branding.dart';

class ShopCard extends StatefulWidget {
  String? name;
  String? location;
  String? mapLink;
  String? openTime;
  String? closeTime;
  String? preview;
  ThemeData? theme;

  ShopCard(
      {Key? key,
      this.name,
      this.location,
      this.mapLink,
      this.openTime,
      this.closeTime,
      this.preview,
      this.theme})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShopCardState();
  }
}

class _ShopCardState extends State<ShopCard> {
  String _name = "";
  String _location = "";
  String _mapLink = "";
  String _openTime = "";
  String _closeTime = "";
  String _preview =
      "https://cdn.leonardo.ai/users/11f55013-a852-41dc-8f77-fa6af6fd814a/generations/f353d4e4-041b-4a6c-901c-c5e8c4690558/Leonardo_Select_A_white_mexican_trucker_dinning_two_tortas_aho_0.jpg";
  ThemeData? _theme;
  _ShopCardState();
  @override
  void initState() {
    super.initState();
    _name = super.widget.name ?? "Shop";
    _location = super.widget.location ?? "";
    _mapLink = super.widget.mapLink ?? "";
    _openTime = super.widget.openTime ?? "";
    _closeTime = super.widget.closeTime ?? "";
    _preview = super.widget.preview ?? _preview;
    _theme = super.widget.theme ?? themeDark;
  }

  @override
  Widget build(BuildContext context) {
    var _content = [
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon(
              Icons.store,
              color: Colors.white70,
            ),
          ),
          Text(_name,
              style: const TextStyle(
                  fontSize: 12,
                  fontFamily: "M Plus Round",
                  color: Colors.black87)),
        ],
      ),
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon(
              Icons.location_on_sharp,
              color: Colors.white70,
            ),
          ),
          Text(_location,
              style: const TextStyle(
                  fontSize: 9,
                  fontFamily: "M Plus Round",
                  color: Colors.black87)),
        ],
      ),
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon(
              Icons.access_time_sharp,
              color: Colors.white70,
            ),
          ),
          Text("$_openTime - $_closeTime",
              style: const TextStyle(
                  fontSize: 9,
                  fontFamily: "M Plus Round",
                  color: Colors.black87)),
        ],
      )
    ];
    var contImage = Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          image: DecorationImage(image: NetworkImage(_preview))),
    );
    var contInfo = Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      color: Colors.white,
      child: Column(children: _content),
    );
    return Column(
      children: [contImage, contInfo],
    );
  }
}
