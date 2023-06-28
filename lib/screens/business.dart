import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_trail/cards/preview.dart';
import 'package:flutter_trail/models/user.dart';

import '../cards/image.dart';
import '../forms/new_business.dart';
import '../forms/new_shop.dart';
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
  int _businessIndex = 1;
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
      _businessIndex = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    var contLogo = Container(
      alignment: Alignment.topLeft,
    );
    var contLstCardSlides = FutureBuilder<List<Business>>(
        future: _jsonBusinesses,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var slides = snapshot.data!;
            return HorizontalCardList(
                height: 150,
                title: _title,
                topRightButtonLabel: '',
                background: Colors.transparent,
                children: slides
                    .map((slide) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: OutlinedButton(
                            onPressed: () {
                              _onSwap(slide.id);
                            },
                            child: ImageCard(
                                image: NetworkImage(slide.logoURL != null
                                    ? slide.logoURL.toString() == ''
                                        ? "https://unsplash.com/es/fotos/nEwLb1onsDo"
                                        : slide.logoURL.toString()
                                    : "https://imgur.com/8m1tosq")))))
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
    var contInfo = FutureBuilder<List<Business>>(
        future: _jsonBusinesses,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var business = snapshot.data!.firstWhere(
              (element) => element.id == _businessIndex,
            );
            return Container(
              padding: const EdgeInsets.all(15),
              width: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [const Icon(Icons.business), Text(business.name)],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_pin),
                      Text(business.brand ?? "")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.watch_later_outlined),
                      Text(business.industry ?? "")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.map),
                      Text(business.taxID ?? "")
                    ],
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Some data couldn't be retrieved"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
    var contProducts = Container();
    var contEdit = Container();
    var contShops = FutureBuilder<List<Business>>(
      future: _jsonBusinesses,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          var business = snapshot.data!.firstWhere(
            (element) => element.id == _businessIndex,
          );
          return FutureBuilder<List<Shop>>(
            future: _jsonShops,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Shop> shops = [];
                for (var shop in snapshot.data!) {
                  if (shop.holder!.id == _businessIndex) {
                    shops.add(shop);
                    print(shop.name);
                  }
                }
                return HorizontalCardList(
                  title: "${business.name} shops",
                  children: shops
                      .map((e) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: PreviewCard(
                            strOverlayTitle: e.name,
                          )))
                      .toList(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Some data couldn't be retrieved"),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Some data couldn't be retrieved"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
    var column = Column(
      children: [contLstCardSlides, contInfo, contShops],
    );
    var floatingActionButton = FutureBuilder<List<Business>>(
        future: _jsonBusinesses,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var _holder = snapshot.data!.firstWhere(
              (element) => element.id == _businessIndex,
            );
            return FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          backgroundColor: Colors.transparent,
                          content: NewShopForm(holder: _holder!));
                    });
              },
              tooltip: 'New Business',
              child: const Icon(Icons.add_business_rounded,
                  color: Color(colorPrimaryDarkBrand)),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Some data couldn't be retrieved"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
    var scaffold = Scaffold(
      body: column,
      floatingActionButton: floatingActionButton,
    );
    return scaffold;
  }
}
