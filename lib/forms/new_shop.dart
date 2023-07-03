import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_trail/models/business.dart';
import 'package:flutter_trail/themes/branding.dart';

import '../models/shop.dart';
import '../models/user.dart';

class NewShopForm extends StatefulWidget {
  ThemeData? theme;
  Business holder;
  NewShopForm({Key? key, this.theme, required this.holder}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewShopFormState();
  }
}

class _NewShopFormState extends State<NewShopForm> {
  ThemeData? _theme;
  bool _isAccepted = false;
  Business? _holder;
  TextEditingController _ctrlName = TextEditingController();
  TextEditingController _ctrlDescription = TextEditingController();
  TextEditingController _ctrlAddress = TextEditingController();
  TextEditingController _ctrlNeighborhood = TextEditingController();
  TextEditingController _ctrlTown = TextEditingController();
  TextEditingController _ctrlProvince = TextEditingController();
  TextEditingController _ctrlCountry = TextEditingController();
  TextEditingController _ctrlZipcode = TextEditingController();
  TextEditingController _ctrlPhotoUrl = TextEditingController();
  TextEditingController _ctrlMapLink = TextEditingController();
  _NewShopFormState();
  @override
  void initState() {
    super.initState();
    _theme = super.widget.theme ?? themeDark;
    _holder = super.widget.holder;
  }

  @override
  void dispose() {
    _ctrlName.dispose();
    _ctrlDescription.dispose();
    _ctrlAddress.dispose();
    _ctrlNeighborhood.dispose();
    _ctrlTown.dispose();
    _ctrlProvince.dispose();
    _ctrlCountry.dispose();
    _ctrlZipcode.dispose();
    _ctrlPhotoUrl.dispose();
    _ctrlMapLink.dispose();
    super.dispose();
  }

  void create() async {
    String name = _ctrlName.text;
    String description = _ctrlDescription.text;
    String address = _ctrlAddress.text;
    String neighborhood = _ctrlNeighborhood.text;
    String town = _ctrlTown.text;
    String province = _ctrlProvince.text;
    String country = _ctrlCountry.text;
    String zipcode = _ctrlZipcode.text;
    String photoURL = _ctrlPhotoUrl.text;
    String mapLink = _ctrlMapLink.text;
    var shops = await Shop.static().fetchAssets('test/shops.json');
    final id = shops.length + 1;
    Shop shop = Shop(
        id: id,
        name: name,
        description: description,
        address: address,
        neighborhood: neighborhood,
        town: town,
        province: province,
        country: country,
        zipcode: zipcode,
        mapLink: mapLink,
        photoURL: photoURL,
        holder: _holder!);
    File file = File('test/shops.json');
    shops.add(shop);
    file.writeAsStringSync(jsonEncode(shops.map((e) => e.toJSON()).toList()));
    _isAccepted = true;
  }

  void linkBack(BuildContext context) {
    Navigator.pop(context, _isAccepted);
  }

  @override
  Widget build(BuildContext context) {
    var contTitle = Center(
      child: Text(
        "Add shop",
        style: TextStyle(
            color: _theme!.colorScheme.primary,
            fontSize: 50,
            fontWeight: FontWeight.bold),
      ),
    );
    var contCloseButton = Container(
      alignment: Alignment.topRight,
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.red),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close),
        splashColor: Colors.red,
        splashRadius: 100,
      ),
    );
    var form = Form(
        key: const Key("Add-shop-form"),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsetsDirectional.only(top: 20),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Name"),
                  controller: _ctrlName,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Name"),
                      hintText: "My Business, Inc."),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Description"),
                  controller: _ctrlDescription,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Description"),
                      hintText: "What makes my shop spetial"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Address"),
                  controller: _ctrlAddress,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Address"),
                      hintText: "#1 Trading Rd."),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Neighborhood"),
                  controller: _ctrlNeighborhood,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Neighborhood"),
                      hintText: "Trading Bay"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Town"),
                  controller: _ctrlTown,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Town"),
                      hintText: "Tradingburgh"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Province"),
                  controller: _ctrlProvince,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Province"),
                      hintText: "Tradingham"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Zipcode"),
                  controller: _ctrlZipcode,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Zipcode"),
                      hintText: "#####"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Map-link"),
                  controller: _ctrlZipcode,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Map link"),
                      hintText: "https://mapservice.com/my-shop-location-url"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Photo-URL"),
                  controller: _ctrlPhotoUrl,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Photo URL"),
                      hintText:
                          "https://cdn.mybusiness.com/my-shop-photo-path"),
                )),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          onPressed: () {
                            linkBack(context);
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: _theme!.colorScheme.onError,
                                fontWeight: FontWeight.bold),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            create();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Shop ${_ctrlName.text} added to business ${_holder!.name}")));
                            linkBack(context);
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: _theme!.colorScheme.onPrimary,
                                fontWeight: FontWeight.bold),
                          ))
                    ]))
          ],
        ));
    return Container(
      alignment: Alignment.topCenter,
      width: 600,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(colorSecondaryLightBrand)),
      child: ListView(children: [contTitle, form]),
    );
  }
}
