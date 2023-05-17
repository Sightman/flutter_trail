import 'package:flutter/material.dart';
import 'package:flutter_trail/branding.dart';

class BottomNavBar extends StatelessWidget {
  final Theme? theme;
  const BottomNavBar({Key? key, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomNavBar = Theme(
        data: Theme.of(context).copyWith(
            canvasColor: const Color(colorBackgroundDarkDefault),
            primaryColor: const Color(colorPrimaryDarkBrand)),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.event), label: "Calendar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "Dashboard"),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: "Contacts"),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More")
          ],
          showUnselectedLabels: true,
        ));
    //throw UnimplementedError();
    return bottomNavBar;
  }
}
