import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_trail/menus/persistent_banner.dart';
import 'package:flutter_trail/screens/market.dart';
import 'package:flutter_trail/screens/more.dart';
import 'package:flutter_trail/screens/profile.dart';
import 'package:flutter_trail/screens/wallet.dart';

import 'menus/bottom_nav_bar.dart';
import 'screens/home.dart';
import 'themes/branding.dart';

class FlutterTrail extends StatefulWidget {
  FlutterTrail({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  State<StatefulWidget> createState() {
    return _FlutterTrail();
  }
}

class _FlutterTrail extends State<FlutterTrail> {
  String? _title;
  String? _host;
  List<Widget> _lstWidgets = [];
  int widgetIndex = 2;
  _FlutterTrail();

  @override
  void initState() {
    super.initState();
    _title = super.widget.title;
    _host = dotenv.env['HOST'];
    _lstWidgets = [
      MarketScreen(
        collection: "stations",
        switchScreen: switchScreen,
      ),
      WalletScreen(),
      HomeScreen(),
      ProfileScreen(),
      MoreScreen()
    ];
  }

  void switchScreen(BuildContext context, Widget screen) {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    });
  }

  void switchTab(int index) {
    setState(() {
      widgetIndex = index;
    });
  }

  void _scan() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("QR Scanner")));
  }

  @override
  Widget build(BuildContext context) {
    var navBarItems = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.local_gas_station), label: "Charge"),
      const BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      const BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More")
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, 150),
        child: PersistentBanner(
          title: _title,
          leading: const Image(image: NetworkImage(imgLogoBrand)),
          actions: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.all(2),
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: themeDark.primaryColor),
              child: Text(
                "$widgetIndex pt",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            Icon(
              Icons.diamond_sharp,
              color: themeDark.primaryColor,
              size: 40,
            )
          ],
        ),
      ),
      body: _lstWidgets[widgetIndex],
      bottomNavigationBar: BottomNavBar(
        items: navBarItems,
        selectedItem: 2,
        switchTab: switchTab,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scan,
        tooltip: 'Scan',
        child: const Icon(Icons.qr_code_scanner_rounded,
            color: Color(colorPrimaryDarkBrand)),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
