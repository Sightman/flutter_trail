import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_trail/menus/persistent_banner.dart';
import 'package:flutter_trail/themes/branding.dart';

import '../models/product.dart';

class ProductScreen extends StatefulWidget {
  Product? product;
  VoidCallback? switchScreen;
  ProductScreen({Key? key, this.product, this.switchScreen}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductScreenState();
  }
}

class _ProductScreenState extends State<ProductScreen> {
  Product? _product;
  VoidCallback? _switchScreen;
  _ProductScreenState();
  @override
  void initState() {
    super.initState();
    _product = super.widget.product;
    _switchScreen = super.widget.switchScreen;
  }

  Future<void> linkExternal(String url) async {
    if (await canLaunchUrl(Uri(path: url))) {
      await launchUrl(Uri(path: url));
    } else {
      ScaffoldMessenger.maybeOf(context)!
          .showSnackBar(SnackBar(content: Text("Can't launch $url")));
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle stlInfo =
        TextStyle(color: Colors.blueGrey.shade200, fontSize: 12);
    var contPhoto = Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5), topRight: Radius.circular(5)),
          boxShadow: const [BoxShadow(color: Colors.black26)],
          image: DecorationImage(
              image: NetworkImage(_product!.photoURL != ""
                  ? _product!.photoURL!
                  : imgLogoBrand))),
    );
    var colInfo = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              _product!.name,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _product!.brand!,
              style: stlInfo,
            ),
            Text(
              _product!.model!,
              style: stlInfo,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Price:",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "\$${_product!.price} ${_product!.currency} / ${_product!.volumeUnit}",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Reward:",
              style: TextStyle(
                  color: themeDark.highlightColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "${_product!.pointsRewarded} pt",
              style: TextStyle(
                  color: themeDark.highlightColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        TextButton.icon(
            onPressed: () async {
              await linkExternal(_product!.photoURL!);
            },
            icon: const Icon(
              Icons.location_searching,
              size: 25,
            ),
            label: const Text(
              "Find station",
              style: TextStyle(fontSize: 25),
            ))
      ],
    );
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150),
          child: PersistentBanner(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: _switchScreen,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(children: [contPhoto, colInfo]),
        ));
  }
}
