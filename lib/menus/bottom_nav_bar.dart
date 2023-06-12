import 'package:flutter/material.dart';
import '/themes/branding.dart';

class BottomNavBar extends StatefulWidget {
  ThemeData? theme;
  int? selectedItem;
  List<BottomNavigationBarItem> items;
  Function? switchTab;
  BottomNavBar(
      {Key? key,
      this.theme,
      this.selectedItem,
      required this.items,
      this.switchTab})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavBarState();
  }
}

class _BottomNavBarState extends State<BottomNavBar> {
  int? _selectedItem;
  ThemeData? _theme;
  List<BottomNavigationBarItem> _items = [];
  Function? _switchTab;
  _BottomNavBarState();
  @override
  void initState() {
    super.initState();
    _selectedItem = super.widget.selectedItem;
    _theme = super.widget.theme ?? themeDark;
    _items = super.widget.items;
    _switchTab = super.widget.switchTab;
  }

  void _onTap(int item) {
    setState(() {
      _selectedItem = item;
      if (_switchTab != null) {
        _switchTab!(_selectedItem);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$_selectedItem")));
      }
    });
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
          selectedIconTheme: _selectedItem != null
              ? _theme!.bottomNavigationBarTheme.selectedIconTheme
              : _theme!.bottomNavigationBarTheme.unselectedIconTheme,
          selectedLabelStyle: _selectedItem != null
              ? _theme!.bottomNavigationBarTheme.selectedLabelStyle
              : _theme!.bottomNavigationBarTheme.unselectedLabelStyle,
          showUnselectedLabels: true,
          useLegacyColorScheme: false,
        ));
    //throw UnimplementedError();
    return bottomNavBar;
  }
}
