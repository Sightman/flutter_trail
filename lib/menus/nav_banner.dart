import 'package:flutter/material.dart';
import 'package:flutter_trail/themes/branding.dart';

class NavBanner extends StatefulWidget {
  String? title;
  ThemeData? theme;
  Widget? leading;
  List<Widget>? actions;
  List<Widget>? widgets;
  List<Widget> items;
  NavBanner(
      {Key? key,
      this.title,
      this.theme,
      this.leading,
      this.actions,
      this.widgets,
      required this.items})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NavBannerState();
  }
}

class NavBannerState extends State<NavBanner> {
  int? _widget;
  String? _title;
  ThemeData? _theme;
  Widget? _leading;
  List<Widget>? _actions;
  List<Widget>? _items;
  List<Widget>? _widgets;
  NavBannerState();
  @override
  void initState() {
    super.initState();
    _widget = 0;
    _title = super.widget.title ?? 'NavBanner';
    _theme = super.widget.theme ?? themeDark;
    _leading = super.widget.leading ?? Image.network(imgLogoBrand);
    _actions = super.widget.actions ?? [];
    _items = super.widget.items;
    _widgets = super.widget.widgets ?? [];
  }

  @override
  Widget build(BuildContext context) {
    var contLeading = Container(
      margin: const EdgeInsets.only(top: 5, left: 5),
      height: _leading == null ? 0.0 : 40.0,
      width: _leading == null ? 0.0 : 40.0,
      constraints: const BoxConstraints(
          minHeight: 0, minWidth: 0, maxHeight: 50, maxWidth: 50),
      color: Colors.transparent,
      child: _leading,
    );
    var contFlexibleSpace = Container(
      margin: const EdgeInsets.only(top: 5),
      child: Theme(data: _theme!, child: NavigationBar(destinations: _items!)),
    );
    var contActions = Container(
      margin: const EdgeInsets.only(top: 5, right: 5),
      constraints: const BoxConstraints(minHeight: 0, maxHeight: 50),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: _actions!),
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
          Text(_title!,
              style:
                  const TextStyle(fontSize: 25, fontFamily: 'M PLUS Rounded')),
          contActions
        ]),
        contFlexibleSpace
      ]),
    );
  }
}
