import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_trail/models/user.dart';

import '../cards/image.dart';
import '../forms/new_business.dart';
import '../lists/horizontal_card.dart';
import '../models/business.dart';
import '../models/shop.dart';
import '../themes/branding.dart';

class BusinessScreen extends StatefulWidget {
  User? owner;
  Function? linkScreen;
  BusinessScreen({Key? key, this.owner, this.linkScreen}) : super(key: key);

  @override
  State<BusinessScreen> createState() {
    return _BusinessScreenState();
  }
}

class _BusinessScreenState extends State<BusinessScreen> {
  String _title = "";
  late Future<List<Business>> _jsonBusinesses;
  late Future<List<Shop>> _jsonShops;
  int _shopIndex = 0;
  User? _owner;
  Function? _linkScreen;
  @override
  void initState() {
    super.initState();
    _jsonBusinesses = Business.static().fetchAssets('test/businesses.json');
    _jsonShops = Shop.static().fetchAssets('test/shops.json');
    _owner = super.widget.owner!;
    _linkScreen = super.widget.linkScreen;
  }

  void _onSwap(int item) async {
    super.setState(() {
      _shopIndex = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    var contLogo = Container(
      alignment: Alignment.topLeft,
    );
    var contLstCardSlides = FutureBuilder(
        future: _jsonShops,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var slides = snapshot.data! as List<Shop>;
            return HorizontalCardList(
                height: 150,
                title: _title,
                topRightButtonLabel: '',
                background: Colors.transparent,
                children: slides
                    .map((slide) => ImageCard(
                        image: NetworkImage(slide.photoURL != null
                            ? slide.photoURL.toString() == ''
                                ? "https://unsplash.com/es/fotos/nEwLb1onsDo"
                                : slide.photoURL.toString()
                            : "https://imgur.com/8m1tosq")))
                    .toList());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Some data could't be retrieved"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
    var contInfo = Container();
    var contProducts = Container();
    var contEdit = Container();
    var contShop = Container();
    var stack = Stack(
      children: [contLstCardSlides, contShop],
    );
    var floatingActionButton = FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  backgroundColor: Colors.transparent,
                  content: NewBusinessForm(owner: _owner!));
            });
      },
      tooltip: 'New Business',
      child: const Icon(Icons.add_business_rounded,
          color: Color(colorPrimaryDarkBrand)),
    );
    var scaffold = Scaffold(
      body: stack,
      floatingActionButton: floatingActionButton,
    );
    return scaffold;
  }
}
