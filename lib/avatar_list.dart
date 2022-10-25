import 'package:flutter/material.dart';

class AvatarList extends StatelessWidget {
  final String? title;
  final Color? background;
  final List<Widget> children;
  const AvatarList(
      {Key? key,
      this.title = 'Avatar List',
      this.background,
      this.children = const <Widget>[]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contTitle = Container(
      margin: EdgeInsets.symmetric(
          vertical: title == null || title == '' ? 0.0 : 5.0),
      height: title == null || title == '' ? 0.0 : 25.0,
      alignment: Alignment.centerLeft,
      child: Text(
        title ?? 'Avatar List',
        textAlign: TextAlign.left,
        style: const TextStyle(
            color: Colors.black,
            height: 1,
            leadingDistribution: TextLeadingDistribution.even,
            fontSize: 25,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            package: 'bizmash'),
      ),
    );
    var contAvatarLst = Container(
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      color: background,
      child: Column(
        children: [
          contTitle,
          SizedBox(
              height: 100,
              child: ListView(
                  scrollDirection: Axis.horizontal, children: children))
        ],
      ),
    );
    return contAvatarLst;
  }
}
