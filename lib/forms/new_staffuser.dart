import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_trail/models/business.dart';
import 'package:flutter_trail/themes/branding.dart';

import '../models/user.dart';

class NewStaffuserForm extends StatefulWidget {
  ThemeData? theme;
  User owner;
  NewStaffuserForm({Key? key, this.theme, required this.owner})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewStaffuserFormState();
  }
}

class _NewStaffuserFormState extends State<NewStaffuserForm> {
  ThemeData? _theme;
  User? _owner;
  TextEditingController _ctrlName = TextEditingController();
  TextEditingController _ctrlBrand = TextEditingController();
  TextEditingController _ctrlTaxId = TextEditingController();
  TextEditingController _ctrlSlogan = TextEditingController();
  TextEditingController _ctrlTagline = TextEditingController();
  TextEditingController _ctrlOneliner = TextEditingController();
  TextEditingController _ctrlLogoUrl = TextEditingController();
  TextEditingController _ctrlIndustry = TextEditingController();
  TextEditingController _ctrlFiscalStatementUrl = TextEditingController();
  _NewStaffuserFormState();
  @override
  void initState() {
    super.initState();
    _theme = super.widget.theme ?? themeDark;
    _owner = super.widget.owner;
  }

  @override
  void dispose() {
    _ctrlName.dispose();
    _ctrlBrand.dispose();
    _ctrlTaxId.dispose();
    _ctrlSlogan.dispose();
    _ctrlTagline.dispose();
    _ctrlOneliner.dispose();
    _ctrlLogoUrl.dispose();
    _ctrlIndustry.dispose();
    _ctrlFiscalStatementUrl.dispose();
    super.dispose();
  }

  void create() async {
    String name = _ctrlName.text;
    String brand = _ctrlBrand.text;
    String taxId = _ctrlTaxId.text;
    String slogan = _ctrlSlogan.text;
    String tagline = _ctrlTagline.text;
    String oneliner = _ctrlOneliner.text;
    String logoUrl = _ctrlLogoUrl.text;
    String industry = _ctrlIndustry.text;
    String fiscalStatementUrl = _ctrlFiscalStatementUrl.text;
    var businesses =
        await Business.static().fetchAssets('test/businesses.json');
    final id = businesses.length + 1;
    Business business = Business(
        id: id,
        name: name,
        brand: brand,
        taxID: taxId,
        slogan: slogan,
        tagLine: tagline,
        oneLiner: oneliner,
        logoURL: logoUrl,
        industry: industry,
        owner: _owner!);
    File file = File('test/businesses.json');
    businesses.add(business);
    file.writeAsStringSync(
        jsonEncode(businesses.map((e) => e.toJSON()).toList()));
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
                  key: const Key("Brand"),
                  controller: _ctrlBrand,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Brand"),
                      hintText: "My brand"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Tax-ID"),
                  controller: _ctrlTaxId,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Tax ID"),
                      hintText: "MB#######"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Slogan"),
                  controller: _ctrlSlogan,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Slogan"),
                      hintText: "My business slogan"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Oneliner"),
                  controller: _ctrlOneliner,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Oneliner"),
                      hintText: "My business oneliner"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Tagline"),
                  controller: _ctrlTagline,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Tagline"),
                      hintText: "My business tagline"),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                color: const Color(0x77000000),
                child: TextField(
                  key: const Key("Industry"),
                  controller: _ctrlIndustry,
                  obscureText: false,
                  decoration: const InputDecoration(
                      fillColor: Colors.white54,
                      hoverColor: Color(colorHighlightDark),
                      label: Text("Industry"),
                      hintText: "My business industry"),
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
