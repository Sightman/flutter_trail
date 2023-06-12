import 'package:flutter/material.dart';
import '/themes/branding.dart';

class BottomNavBar extends StatefulWidget {
  ThemeData? theme;
  int? selectedItem = -1;
  List<BottomNavigationBarItem> items;
  BottomNavBar({Key? key, this.theme, this.selectedItem, required this.items})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavBarState();
  }
}

class _BottomNavBarState extends State<BottomNavBar> {
  int? _widget;
  int? _selectedItem;
  ThemeData? _theme;
  List<BottomNavigationBarItem> _items = [];
  _BottomNavBarState();
  @override
  void initState() {
    super.initState();
    _widget = 0;
    _selectedItem = super.widget.selectedItem ?? -1;
    _theme = super.widget.theme ?? themeDark;
    _items = super.widget.items;
  }

  void _onTap(item) {
    _widget = item;
    SnackBar(
      content: Text("$_widget"),
    );
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavBar = Theme(
        data: Theme.of(context).copyWith(
            canvasColor: const Color(colorBackgroundDarkDefault),
            primaryColor: const Color(colorPrimaryDarkBrand)),
        child: BottomNavigationBar(
          items: _items,
          currentIndex: _selectedItem ?? 0,
          onTap: _onTap,
          selectedIconTheme: _selectedItem! > 0
              ? _theme!.bottomNavigationBarTheme.selectedIconTheme
              : _theme!.bottomNavigationBarTheme.unselectedIconTheme,
          selectedLabelStyle: _selectedItem! > 0
              ? _theme!.bottomNavigationBarTheme.selectedLabelStyle
              : _theme!.bottomNavigationBarTheme.unselectedLabelStyle,
          showUnselectedLabels: true,
          useLegacyColorScheme: false,
        ));
    //throw UnimplementedError();
    return bottomNavBar;
  }
}
