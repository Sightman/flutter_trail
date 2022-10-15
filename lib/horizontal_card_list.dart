import 'package:flutter/material.dart';
import 'package:flutter_trail/branding.dart';

class HorizontalCardList extends StatelessWidget {
  final String? title;
  final String? topRightButtonLabel;
  final int? topRightButtonBackground;
  final Color? background;
  final List<Widget>? children;
  const HorizontalCardList(
      {Key? key,
      this.title,
      this.topRightButtonLabel,
      this.topRightButtonBackground,
      this.background,
      this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contTitle = Container(
        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Text(
          title ?? 'Horizontal List',
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: Colors.black,
              height: 1,
              leadingDistribution: TextLeadingDistribution.even,
              fontSize: 25,
              fontFamily: 'M PLUS Rounded 1C',
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              package: 'bizmash'),
        ));
    var contTopRightButton = Container(
      key: const Key('list-top-right-button'),
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(top: 10.0, right: 10.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(topRightButtonLabel ?? 'More'),
            Icon(
              Icons.more_horiz_rounded,
              color:
                  Color(topRightButtonBackground ?? colorForegroundDarkDefault),
              size: 40,
            )
          ]),
    );
    var contHeading = Stack(
      children: [contTitle, contTopRightButton],
    );
    var contHorizontalList = Container(
      padding: const EdgeInsets.only(top: 0, bottom: 20),
      alignment:
          AlignmentGeometry.lerp(Alignment.topLeft, Alignment.topRight, 1),
      color: background ?? const Color(colorBackgroundDarkDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contHeading,
          Container(
              constraints: const BoxConstraints(
                  minHeight: 210, minWidth: 160, maxHeight: 230),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: children ?? <Widget>[]))
        ],
      ),
    );
    var contSlideForward = Container(
      margin: const EdgeInsets.only(top: 120, right: 5),
      alignment: Alignment.centerRight,
      decoration:
          const BoxDecoration(color: Color(0x77FFFFFF), shape: BoxShape.circle),
      child: const Icon(
        Icons.arrow_forward_rounded,
        color: Colors.blue,
        size: 40,
      ),
    );
    var contSlideBackward = Container(
      margin: const EdgeInsets.only(top: 120, left: 5),
      alignment: Alignment.centerRight,
      decoration:
          const BoxDecoration(color: Color(0x77FFFFFF), shape: BoxShape.circle),
      child: const Icon(
        Icons.arrow_back_rounded,
        color: Colors.blue,
        size: 40,
      ),
    );
    return Stack(children: [
      contHorizontalList,
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [contSlideBackward]),
      Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [contSlideForward])
    ]);
  }
/*
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
  }*/
}
