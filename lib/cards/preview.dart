import 'package:flutter/material.dart';
import '/themes/branding.dart';

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
  final double? dblImageScale;
  final double? width;
  final double? height;
  VoidCallback? onTap;
  PreviewCard(
      {Key? key,
      this.strOverlayTitle,
      this.strCardImage,
      this.iconOverlayTopLeft,
      this.iconOverlayTopRight,
      this.boolOverlayTopRightIcon = false,
      this.boolOverlayBackgroundSolid = false,
      this.colorOverlayBackgroundColor = const Color(0xFF424242),
      this.strBottomBarTitle,
      this.intBottomBarColor = 0xffffffff,
      this.dblImageScale = 1.0,
      this.height = 160,
      this.width = 160,
      this.onTap})
      : super(key: key);

  @override
  State<PreviewCard> createState() {
    return _PreviewCardState();
  }
}

class _PreviewCardState extends State<PreviewCard> {
  Key _key = Key("preview-card");
  String? _strCardImage = imgLogoBrand;
  String? _strOverlayTitle = "Preview card";
  IconData? _iconOverlayTopLeft = Icons.info;
  IconData? _iconOverlayTopRight = Icons.business;
  bool? _boolOverlayTopRightIcon = false;
  bool? _boolOverlayBackgroundSolid = true;
  Color _colorOverlayBackgroundColor = const Color(0xFF424242);
  String? _strBottomBarTitle = 'Bottom bar';
  int? _intBottomBarColor = 0xffffffff;
  double? _dblImageScale = 1.0;
  double _height = 160;
  double _width = 160;
  VoidCallback? _onTap;
  bool _isTapped = false;
  _PreviewCardState();

  @override
  void initState() {
    super.initState();
    _key = widget.key ?? _key;
    _strCardImage = widget.strCardImage ?? _strCardImage;
    _strOverlayTitle = widget.strOverlayTitle;
    _iconOverlayTopLeft = widget.iconOverlayTopLeft;
    _iconOverlayTopRight = widget.iconOverlayTopRight;
    _boolOverlayTopRightIcon = widget.boolOverlayTopRightIcon;
    _boolOverlayBackgroundSolid = widget.boolOverlayBackgroundSolid;
    _colorOverlayBackgroundColor = widget.colorOverlayBackgroundColor;
    _strBottomBarTitle = widget.strBottomBarTitle;
    _intBottomBarColor = widget.intBottomBarColor;
    _dblImageScale = widget.dblImageScale;
    _height = super.widget.height ?? _height;
    _width = super.widget.width ?? _width;
    _onTap = super.widget.onTap;
  }

  void onTap(BuildContext context, Key key) {
    if (_onTap != null) {
      //_onTap!(context, key);
      //dispose();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var contCardImage = Container(
      key: const Key('overlay-image'),
      //margin: const EdgeInsets.only(left: 20),
      alignment: Alignment.center,
      width: _width,
      height: _height,
      foregroundDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
              colors: [Colors.transparent, _colorOverlayBackgroundColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
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
              image: NetworkImage(_strCardImage!, scale: _dblImageScale!))),
    );
    var contOverlayTitle = Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.only(bottom: 5, left: 5),
      width: _width - 10,
      height: _height - 5,
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
        margin: const EdgeInsets.only(top: 5, right: 5),
        height: _height - 5,
        width: _width - 5,
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
      width: _width - 10,
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
      width: _width,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(_intBottomBarColor ?? colorBackgroundLightDefault),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      child: Column(children: [contBottomBarTitle]),
    );
    var cardPreview = Container(
        color: Colors.transparent,
        child: Column(
          key: const Key('card-preview'),
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [stackOverlay, contBottomBar],
        ));
    return GestureDetector(
        onTapDown: (details) {
          setState(() {
            _isTapped = true;
          });
        },
        onTapCancel: () {
          setState(() {
            _isTapped = false;
          });
        },
        onTapUp: (details) {
          setState(() {
            _isTapped = false;
          });
        },
        onTap: _onTap,
        child: cardPreview);
  }
}
