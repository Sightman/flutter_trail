import 'package:flutter/material.dart';
import 'package:flutter_trail/models/user.dart';
import 'package:flutter_trail/themes/branding.dart';

import '../forms/new_business.dart';

class DashboardScreen extends StatefulWidget {
  ThemeData? themeData;
  User owner;
  DashboardScreen({Key? key, this.themeData, required this.owner})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  ThemeData? _themeData;
  User? _owner;

  @override
  void initState() {
    super.initState();
    _themeData = super.widget.themeData ?? themeDark;
    _owner = super.widget.owner;
  }

  @override
  Widget build(BuildContext context) {
    var floatingActionButton = FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  backgroundColor: Colors.transparent,
                  content: NewBusinessForm(owner: _owner!));
            });
      },
      tooltip: 'New Business',
      child: const Icon(Icons.add_business_rounded,
          color: Color(colorPrimaryDarkBrand)),
    );
    return Scaffold(
      body: Center(child: Text("Comming soon")),
      floatingActionButton: floatingActionButton,
    );
  }
}
