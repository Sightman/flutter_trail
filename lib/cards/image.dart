import 'package:flutter/material.dart';
import '/themes/branding.dart';

class ImageCard extends StatelessWidget {
  ImageProvider? image;

  ImageCard({Key? key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var contImage = Container(
      height: 150,
      width: 175,
      margin: const EdgeInsets.only(top: 65.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ],
          image: DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.center,
              image: image ?? const AssetImage(imgLogoBrand))),
    );
    return contImage;
  }
}
