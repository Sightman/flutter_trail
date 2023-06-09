import 'package:flutter/material.dart';
import 'package:flutter_trail/themes/branding.dart';

class PersistentBanner extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final List<Widget> actions;
  final Widget? flexibleSpace;
  const PersistentBanner(
      {Key? key,
      this.title = 'Persistent Banner',
      this.leading,
      this.actions = const <Widget>[],
      this.flexibleSpace})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contLeading = Container(
      margin: const EdgeInsets.only(top: 5, left: 5),
      height: leading == null ? 0.0 : 40.0,
      width: leading == null ? 0.0 : 40.0,
      constraints: const BoxConstraints(
          minHeight: 0, minWidth: 0, maxHeight: 50, maxWidth: 50),
      color: Colors.transparent,
      child: leading,
    );
    var contFlexibleSpace = Container(
      margin: const EdgeInsets.only(top: 5),
      child: flexibleSpace,
    );
    var contActions = Container(
      margin: const EdgeInsets.only(top: 5, right: 5),
      constraints: const BoxConstraints(minHeight: 0, maxHeight: 50),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: actions),
    );
    return Container(
      alignment: const Alignment(-0.9, -0.6),
      height: 200.0,
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
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          contLeading,
          Text(title ?? 'Persistent Banner',
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 25,
                  fontFamily: 'M PLUS Rounded')),
          contActions
        ]),
        contFlexibleSpace
      ]),
    );
  }
}
