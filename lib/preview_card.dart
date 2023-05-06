import 'package:flutter/material.dart';
import 'package:flutter_trail/branding.dart';

class PreviewCard extends StatefulWidget {
  final String? strCardImage;
  final String? strOverlayTitle;
  final IconData? iconOverlayTopLeft;
  final IconData? iconOverlayTopRight;
  final bool? boolOverlayTopRightIcon;
  final bool? boolOverlayBackgroundSolid;
  final Color colorOverlayBackgroundColor;
  final String? strBottomBarTitle;
  final int? intBottomBarColor;
  const PreviewCard(
      {Key? key,
      this.strOverlayTitle,
      this.strCardImage,
      this.iconOverlayTopLeft,
      this.iconOverlayTopRight,
      this.boolOverlayTopRightIcon = false,
      this.boolOverlayBackgroundSolid = false,
      this.colorOverlayBackgroundColor = const Color(0xFF424242),
      this.strBottomBarTitle,
      this.intBottomBarColor = 0xffffffff})
      : super(key: key);

  @override
  State<PreviewCard> createState() {
    return _PreviewCardState();
  }
}

class _PreviewCardState extends State<PreviewCard> {
  Key? _key;
  String? _strCardImage;
  String? _strOverlayTitle = "Preview card";
  IconData? _iconOverlayTopLeft = Icons.info;
  IconData? _iconOverlayTopRight = Icons.business;
  bool? _boolOverlayTopRightIcon = false;
  bool? _boolOverlayBackgroundSolid = true;
  Color _colorOverlayBackgroundColor = const Color(0xFF424242);
  String? _strBottomBarTitle = 'Bottom bar';
  int? _intBottomBarColor = 0xffffffff;
  _PreviewCardState();

  @override
  void initState() {
    super.initState();
    _key = widget.key;
    _strCardImage = widget.strCardImage;
    _strOverlayTitle = widget.strOverlayTitle;
    _iconOverlayTopLeft = widget.iconOverlayTopLeft;
    _iconOverlayTopRight = widget.iconOverlayTopRight;
    _boolOverlayTopRightIcon = widget.boolOverlayTopRightIcon;
    _boolOverlayBackgroundSolid = widget.boolOverlayBackgroundSolid;
    _colorOverlayBackgroundColor = widget.colorOverlayBackgroundColor;
    _strBottomBarTitle = widget.strBottomBarTitle;
    _intBottomBarColor = widget.intBottomBarColor;
  }

  void openItem() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color(colorBackgroundLightDefault),
        content: Text(_strOverlayTitle ?? "My Flutter trail")));
  }

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
              colors: [Colors.transparent, _colorOverlayBackgroundColor],
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
              image: NetworkImage(_strCardImage!))),
    );
    var contOverlayTitle = Container(
      margin: const EdgeInsets.only(top: 135, left: 5),
      width: 150,
      child: Text(
        _strOverlayTitle ?? '',
        key: const Key('overlay-title'),
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 17,
            fontFamily: 'M PLUS Round',
            color: Color(colorBackgroundLightDefault),
            backgroundColor: Colors.transparent),
      ),
    );
    var contOverlayTopRightIcon = Container(
        margin: const EdgeInsets.only(top: 5, right: 5, left: 130),
        alignment: Alignment.topRight,
        child: Icon(_iconOverlayTopRight));
    var stackOverlay = Stack(
      children: [
        contCardImage,
        if (_boolOverlayTopRightIcon ?? false) contOverlayTopRightIcon,
        contOverlayTitle,
      ],
    );
    var contBottomBarTitle = Container(
      margin: const EdgeInsets.all(5),
      width: 150,
      child: Text(
        _strBottomBarTitle ?? '',
        key: const Key('bottombar-title'),
        textAlign: TextAlign.left,
        softWrap: true,
        style: const TextStyle(
            fontSize: 12,
            fontFamily: 'M PLUS Round',
            color: Color(colorForegroundLightDefault)),
      ),
    );
    var contBottomBar = Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(_intBottomBarColor ?? colorBackgroundLightDefault),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      child: Column(children: [contBottomBarTitle]),
    );
    var cardPreview = Container(
        margin: const EdgeInsets.all(5),
        color: Colors.transparent,
        constraints: const BoxConstraints(minHeight: 160, maxHeight: 230),
        child: Column(
          key: const Key('card-preview'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [stackOverlay, contBottomBar],
        ));
    return InkWell(onTap: openItem, child: cardPreview);
  }
}
