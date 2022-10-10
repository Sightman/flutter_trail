import 'package:flutter/material.dart';
import 'package:flutter_trail/branding.dart';

class PreviewCard extends Card {
  final String? strCardImage;
  final String? strOverlayTitle;
  final IconData? iconOverlayTopLeft;
  final IconData? iconOverlayTopRight;
  final bool? boolOverlayTopRightIcon;
  final bool? boolOverlayBackgroundSolid;
  final int intOverlayBackgroundColor;
  final String? strBottomBarTitle;
  final int intBottomBarColor;
  const PreviewCard(
      {Key? key,
      this.strOverlayTitle,
      this.strCardImage,
      this.iconOverlayTopLeft,
      this.iconOverlayTopRight,
      this.boolOverlayTopRightIcon = false,
      this.boolOverlayBackgroundSolid = false,
      this.intOverlayBackgroundColor = 0xFF424242,
      this.strBottomBarTitle,
      this.intBottomBarColor = 0xffffffff})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contCardImage = Container(
      key: const Key('overlay-image'),
      //margin: const EdgeInsets.only(left: 20),
      alignment: Alignment.center,
      width: 160,
      height: 160,
      foregroundDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
              colors: [Colors.transparent, Color(intOverlayBackgroundColor)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
                color: Color(colorSecondaryDarkBrand),
                blurStyle: BlurStyle.inner,
                offset: Offset.zero,
                blurRadius: 100,
                spreadRadius: 0)
          ],
          image: DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.center,
              image: NetworkImage(strCardImage ?? ''))),
    );
    var contOverlayTitle = Container(
      margin: const EdgeInsets.only(top: 135, left: 5),
      width: 150,
      child: Text(
        strOverlayTitle ?? '',
        key: const Key('overlay-title'),
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 17,
            fontFamily: 'M PLUS Round 1c',
            color: Color(colorBackgroundDarkDefault),
            backgroundColor: Colors.transparent),
      ),
    );
    var contOverlayTopRightIcon = Container(
        margin: const EdgeInsets.only(top: 5, right: 5, left: 130),
        alignment: Alignment.topRight,
        child: Icon(iconOverlayTopRight));
    var stackOverlay = Stack(
      children: [
        contCardImage,
        if (boolOverlayTopRightIcon ?? false) contOverlayTopRightIcon,
        contOverlayTitle,
      ],
    );
    var contBottomBarTitle = Container(
      margin: const EdgeInsets.all(5),
      width: 150,
      child: Text(
        strBottomBarTitle ?? '',
        key: const Key('bottombar-title'),
        textAlign: TextAlign.left,
        softWrap: true,
        style: const TextStyle(
            fontSize: 12,
            fontFamily: 'M PLUS Round 1c',
            color: Color(colorForegroundDarkDefault)),
      ),
    );
    var contBottomBar = Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(intBottomBarColor),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      child: Column(children: [contBottomBarTitle]),
    );
    var cardPreview = Card(
        margin: const EdgeInsets.all(5),
        color: Colors.transparent,
        child: Column(
          key: const Key('card-preview'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [stackOverlay, contBottomBar],
        ));
    //throw UnimplementedError();
    return cardPreview;
  }
}
