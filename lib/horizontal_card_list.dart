import 'dart:developer';

import 'package:flutter/material.dart';

class HorizontalCardList extends StatelessWidget {
  static List<Widget> children = const <Widget>[];
  const HorizontalCardList({Key? key, List<Widget> children = const <Widget>[]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var horizontalList = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
    return horizontalList;
  }

  void add(Widget child) {
    try {
      children.add(child);
    } catch (e) {
      log(e.toString());
    }
  }

  void remove(Key key) {
    try {
      children.removeWhere((item) => item.key == key);
    } catch (e) {
      log(e.toString());
    }
  }
}
