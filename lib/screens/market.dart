import 'package:flutter/material.dart';
import 'package:flutter_trail/cards/preview.dart';
import 'package:flutter_trail/models/product.dart';
import 'package:flutter_trail/screens/home.dart';
import 'package:flutter_trail/screens/product.dart';
import 'package:flutter_trail/src/requestor.dart';

import '../cards/image.dart';
import '../lists/horizontal_card.dart';

class MarketScreen extends StatefulWidget {
  String? title;
  String? collection;
  Function? switchScreen;
  MarketScreen({Key? key, this.title, this.collection, this.switchScreen})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MarketScreenState();
  }
}

class _MarketScreenState extends State<MarketScreen> {
  String? _title = "";
  late Future<List<dynamic>>? _jsonShops;
  late Future<List<dynamic>> _jsonCatalogue;
  Function? _switchScreen;
  Product? _selectedItem;

  _MarketScreenState();

  @override
  void initState() {
    super.initState();
    _title = super.widget.title ?? _title;
    _jsonShops = Requestor()
        .arrayFromAssets("test/${super.widget.collection ?? "slides"}.json");
    _jsonCatalogue = Requestor().arrayFromAssets("test/products.json");
    _switchScreen = super.widget.switchScreen;
  }

  void openItem(Product item) {
    setState(() {
      _selectedItem = item;
    });
    if (_switchScreen != null) {
      _switchScreen!(
          context,
          ProductScreen(
            product: _selectedItem,
            switchScreen: () {
              Navigator.pop(context);
            },
          ));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var contSearchField = Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.grey),
        child: TextField(
          style: TextStyle(fontSize: 20, color: Colors.grey.shade900),
          decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                size: 40,
                color: Colors.grey.shade800,
              ),
              hintText: "Search"),
        ));
    var contLstCardSlides = FutureBuilder(
        future: _jsonShops,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var slides = snapshot.data! as List<dynamic>;
            return HorizontalCardList(
                height: 150,
                title: _title,
                topRightButtonLabel: '',
                background: Colors.transparent,
                children: slides
                    .map((slide) => ImageCard(
                        image: NetworkImage(slide['photo-url'] != null
                            ? slide['photo-url'].toString() == ''
                                ? "https://unsplash.com/es/fotos/nEwLb1onsDo"
                                : slide['photo-url'].toString()
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
    var contProductsList = FutureBuilder(
        future: _jsonCatalogue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data! as List<dynamic>;
            return Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 420,
              child: ListView(
                children: Product.static()
                    .mapJSON(data)
                    .map((e) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: PreviewCard(
                          key: Key("${e.id}"),
                          strOverlayTitle:
                              "${e.currency} ${e.price} / ${e.volumeUnit}",
                          strBottomBarTitle: e.name,
                          height: 300,
                          width: 300,
                          onTap: () {
                            openItem(e);
                          },
                        )))
                    .toList(),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("Some data couldn't be retrieved"));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
    var contMarket = Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: [contSearchField, contLstCardSlides, contProductsList],
        ));
    return contMarket;
  }
}
