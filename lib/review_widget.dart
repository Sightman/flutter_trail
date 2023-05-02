import 'package:flutter/material.dart';
import 'package:flutter_trail/avatar.dart';
import 'package:flutter_trail/branding.dart';

class ReviewWidget extends StatelessWidget {
  final Avatar? avatar;
  final String? title;
  final String? comment;
  const ReviewWidget({Key? key, this.avatar, this.title, this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contAvatar = Container(
      margin: const EdgeInsets.all(5.0),
      child: avatar,
    );
    var contComment = Container(
        margin: const EdgeInsets.all(5.0),
        child: Column(children: [
          Text(
            title ?? 'Title',
            style: const TextStyle(
                color: Color(colorPrimaryDarkBrand),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'M PLUS Rounded 1c'),
          ),
          Text(
            comment ?? 'Tell us what you think',
            style: const TextStyle(
                color: Color(colorForegroundDarkDefault),
                fontSize: 15,
                fontFamily: 'M PLUS Rounded 1c'),
          )
        ]));
    var contReview = Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          border:
              Border(bottom: BorderSide(color: Color(colorPrimaryDarkBrand)))),
      child: Row(children: [contAvatar, contComment]),
    );
    return contReview;
  }
}
