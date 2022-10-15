import 'package:flutter/material.dart';
import 'package:flutter_trail/branding.dart';

class ReviewList extends StatelessWidget {
  final List<Widget>? children;
  const ReviewList({Key? key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contReviewList = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: const Color(colorBackgroundDarkDefault)),
      child: ListView(children: children ?? []),
    );
    return contReviewList;
  }
}
