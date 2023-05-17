import 'package:flutter/material.dart';
import 'package:flutter_trail/menus/persistent_banner.dart';

import 'themes/branding.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    var contMainMenu = Container(
      margin: const EdgeInsets.only(top: 200.0),
      constraints: const BoxConstraints(minHeight: 100.0, maxHeight: 200.0),
      color: Colors.cyanAccent,
    );
    return Stack(
      children: [
        PersistentBanner(
          leading: Image.network(imgLogoBrand),
          title: 'The flutter learning path',
        ),
        contMainMenu
      ],
    );
  }
}
