import 'package:flutter/material.dart';
import 'package:flutter_trail/branding.dart';

class PersistentBanner extends StatelessWidget {
  final String? title;
  final Widget? leading;
  const PersistentBanner({Key? key, this.title, this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 250.0,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(colorSecondaryDarkBrand),
                Color(colorSecondaryLightBrand)
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      child: Column(children: [
        Row(children: [
          Text(title ?? 'Persistent Banner',
              style: const TextStyle(
                  fontSize: 25, fontFamily: 'M PLUS Rounded 1C'))
        ])
      ]),
    );
  }
}
