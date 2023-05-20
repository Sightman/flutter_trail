import 'package:flutter/material.dart';
import '/themes/branding.dart';

class BottomNavBar extends StatefulWidget {
  final Theme? theme;
  List<BottomNavigationBarItem> items;
  BottomNavBar({Key? key, this.theme, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavBarState();
  }
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<BottomNavigationBarItem> _items = [];
  _BottomNavBarState();
  @override
  void initState() {
    super.initState();
    _items = super.widget.items;
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavBar = Theme(
        data: Theme.of(context).copyWith(
            canvasColor: const Color(colorBackgroundDarkDefault),
            primaryColor: const Color(colorPrimaryDarkBrand)),
        child: BottomNavigationBar(
          items: _items,
          showUnselectedLabels: true,
        ));
    //throw UnimplementedError();
    return bottomNavBar;
  }
}
