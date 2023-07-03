import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_trail/screens/welcome.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  _ProfileScreenState();
  @override
  void initState() {
    super.initState();
  }

  void logout(BuildContext context) {
    var jsonSession = File("/test/session.json");
    jsonSession.writeAsStringSync("", mode: FileMode.writeOnly, flush: true);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var contLogoutButton = Container(
      alignment: Alignment.center,
      child: OutlinedButton(
        onPressed: () {
          logout(context);
        },
        child: const Text("Logout"),
      ),
    );
    return contLogoutButton;
  }
}
