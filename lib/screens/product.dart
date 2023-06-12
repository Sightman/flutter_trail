import 'package:flutter/material.dart';
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
          image: DecorationImage(
              image: NetworkImage(_product!.photoURL ?? imgLogoBrand))),
    );
    var colInfo = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _product!.name,
              style: stlInfo,
            ),
            Text(
              "\$${_product!.price}",
              style: stlInfo,
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
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Reward: ${_product!.pointsRewarded} pt",
              style: TextStyle(
                  color: themeDark.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )
          ],
        )
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
