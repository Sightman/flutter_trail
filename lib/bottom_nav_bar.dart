import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomNavBar = BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.event), label: "Calendar"),
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: "Dashboard"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Contacts"),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More")
      ],
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.cyan,
      showUnselectedLabels: true,
    );
    //throw UnimplementedError();
    return bottomNavBar;
  }
}
