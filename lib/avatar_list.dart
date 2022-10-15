import 'package:flutter/material.dart';

class AvatarList extends StatelessWidget {
  final String? title;
  final List<Widget>? children;
  const AvatarList({Key? key, this.title, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contTitle = Container(
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Text(
        title ?? 'Momentos',
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
      color: Colors.blueGrey,
      child: Column(
        children: [
          Row(children: [contTitle]),
          SizedBox(
              height: 100,
              child: ListView(
                  scrollDirection: Axis.horizontal, children: children ?? []))
        ],
      ),
    );
    return contAvatarLst;
  }
}
