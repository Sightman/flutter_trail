import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_trail/models/business.dart';
import 'package:flutter_trail/models/product.dart';
import 'package:flutter_trail/themes/branding.dart';

import '../models/user.dart';

class NewProductForm extends StatefulWidget {
  ThemeData? theme;
  Business distributor;
  NewProductForm({Key? key, this.theme, required this.distributor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewProductFormState();
  }
}

class _NewProductFormState extends State<NewProductForm> {
  ThemeData? _theme;
  Business? _distributor;
  TextEditingController _ctrlName = TextEditingController();
  TextEditingController _ctrlModel = TextEditingController();
  TextEditingController _ctrlBrand = TextEditingController();
  TextEditingController _ctrlDimensionUnit = TextEditingController();
  TextEditingController _ctrlVolumeUnit = TextEditingController();
  TextEditingController _ctrlWeightUnit = TextEditingController();
  TextEditingController _ctrlWidth = TextEditingController();
  TextEditingController _ctrlHeight = TextEditingController();
  TextEditingController _ctrlLength = TextEditingController();
  TextEditingController _ctrlVolume = TextEditingController();
  TextEditingController _ctrlWeight = TextEditingController();
  TextEditingController _ctrlPrice = TextEditingController();
  TextEditingController _ctrlCurrency = TextEditingController();
  TextEditingController _ctrlSku = TextEditingController();
  TextEditingController _ctrlPointsReward = TextEditingController();
  TextEditingController _ctrlPhotoUrl = TextEditingController();
  _NewProductFormState();
  @override
  void initState() {
    super.initState();
    _theme = super.widget.theme ?? themeDark;
    _distributor = super.widget.distributor;
  }

  @override
  void dispose() {
    _ctrlName.dispose();
    _ctrlModel.dispose();
    _ctrlBrand.dispose();
    _ctrlDimensionUnit.dispose();
    _ctrlVolumeUnit.dispose();
    _ctrlWeightUnit.dispose();
    _ctrlWidth.dispose();
    _ctrlHeight.dispose();
    _ctrlLength.dispose();
    _ctrlVolume.dispose();
    _ctrlWeight.dispose();
    _ctrlPrice.dispose();
    _ctrlCurrency.dispose();
    _ctrlSku.dispose();
    _ctrlPointsReward.dispose();
    _ctrlPhotoUrl.dispose();
    super.dispose();
  }

  void create() async {
    String name = _ctrlName.text;
    String model = _ctrlModel.text;
    String brand = _ctrlBrand.text;
    String dimensionUnit = _ctrlDimensionUnit.text;
    String volumeUnit = _ctrlVolumeUnit.text;
    String weightUnit = _ctrlWeightUnit.text;
    double width = _ctrlWidth.text as double;
    double height = _ctrlHeight.text as double;
    double length = _ctrlLength.text as double;
    double volume = _ctrlVolume.text as double;
    double weight = _ctrlWeight.text as double;
    double price = _ctrlPrice.text as double;
    String currency = _ctrlCurrency.text;
    String sku = _ctrlSku.text;
    double pointsReward = _ctrlPointsReward.text as double;
    String photoURL = _ctrlPhotoUrl.text;
    var products = await Product.static().fetchAssets('test/products.json');
    final id = products.length + 1;
    Product product = Product(
        id: id,
        name: name,
        model: model,
        brand: brand,
        dimensionUnit: dimensionUnit,
        volumeUnit: volumeUnit,
        weightUnit: weightUnit,
        width: width,
        height: height,
        length: length,
        volume: volume,
        weight: weight,
        price: price,
        currency: currency,
        sku: sku,
        pointsRewarded: pointsReward,
        photoURL: photoURL,
        distributor: _distributor!);
    File file = File('test/businesses.json');
    products.add(product);
    file.writeAsStringSync(
        jsonEncode(products.map((e) => e.toJSON()).toList()));
  }

  void linkBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var contTitle = Center(
      child: Text(
        "Add business",
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
        key: const Key("Add-business-form"),
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
                  key: const Key("Model"),
                  controller: _ctrlModel,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Model"),
                      hintText: "Product model"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Brand"),
                  controller: _ctrlBrand,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Brand"),
                      hintText: "Product brand"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Dimension-unit"),
                  controller: _ctrlDimensionUnit,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Dimension unit"),
                      hintText: "m|cm|ft|in"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Volume-unit"),
                  controller: _ctrlVolumeUnit,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Volume unit"),
                      hintText: "l|ml|cm3|gl"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Weight-unit"),
                  controller: _ctrlWeightUnit,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Weight unit"),
                      hintText: "kg|g|oz|pd"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Width"),
                  controller: _ctrlWidth,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Width"),
                      hintText: "##.##"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Height"),
                  controller: _ctrlHeight,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Height"),
                      hintText: "##.##"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Length"),
                  controller: _ctrlLength,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Length"),
                      hintText: "##.##"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Volume"),
                  controller: _ctrlVolume,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Volume"),
                      hintText: "##.##"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Weight"),
                  controller: _ctrlWeight,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Weight"),
                      hintText: "##.##"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Price"),
                  controller: _ctrlPrice,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Price"),
                      hintText: "##.##"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Currency"),
                  controller: _ctrlCurrency,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Currency"),
                      hintText: "USD|MXN|EUR|BTC|ETH"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("SKU"),
                  controller: _ctrlSku,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("SKU"),
                      hintText: "################"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Points-reward"),
                  controller: _ctrlPointsReward,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Points reward"),
                      hintText: "##.##"),
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
                      hintText: "https://cdn.mybusiness.com/my-product-path"),
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
                                content:
                                    Text("Business ${_ctrlName.text} added")));
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
