import 'package:flutter/material.dart';
import 'package:flutter_trail/themes/branding.dart';

class Avatar extends StatelessWidget {
  final String? photoURL;
  final String? name;
  final Color? background;
  final Color? foreground;
  final double? imageScale;
  const Avatar(
      {Key? key,
      this.photoURL = "",
      this.name,
      this.background,
      this.foreground,
      this.imageScale = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contPhoto = Container(
      height: 55.0,
      width: 55.0,
      margin: const EdgeInsets.all(5.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border:
              Border.all(color: const Color(colorPrimaryDarkBrand), width: 3.0),
          color: Colors.blueGrey,
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
          image: DecorationImage(
              image: NetworkImage(photoURL!, scale: imageScale!))),
    );
    var contName = Container(
      alignment: Alignment.center,
      child: Text(
        name ?? '',
        style: TextStyle(
            color: foreground ?? Colors.grey,
            fontSize: 10.0,
            fontFamily: 'M PLUS 1C'),
      ),
    );
    var contAvatar = Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: background ?? const Color(colorSecondaryDarkBrand))
      ], borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        children: [contPhoto, contName],
      ),
    );
    return contAvatar;
  }
}
