import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  MoreScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MoreScreenState();
  }
}

class _MoreScreenState extends State<MoreScreen> {
  _MoreScreenState();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Comming soon..."),
    );
  }
}
