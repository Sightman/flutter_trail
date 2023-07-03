import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_trail/forms/new_business.dart';
import 'package:flutter_trail/menus/persistent_banner.dart';
import 'package:flutter_trail/models/user.dart';
import 'package:flutter_trail/screens/business_home.dart';
import 'package:flutter_trail/screens/dashboard.dart';
import 'package:flutter_trail/screens/market.dart';
import 'package:flutter_trail/screens/more.dart';
import 'package:flutter_trail/screens/profile.dart';
import 'package:flutter_trail/screens/wallet.dart';

import 'menus/bottom_nav_bar.dart';
import 'screens/consumer_home.dart';
import 'themes/branding.dart';

class FlutterTrail extends StatefulWidget {
  String title;
  User user;
  FlutterTrail({Key? key, required this.title, required this.user})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FlutterTrail();
  }
}

class _FlutterTrail extends State<FlutterTrail> {
  String? _title;
  String? _host;
  List<Widget> _lstWidgets = [];
  int widgetIndex = 0;
  User? _user;
  _FlutterTrail();

  @override
  void initState() {
    super.initState();
    _title = super.widget.title;
    _host = dotenv.env['HOST'];
    _user = super.widget.user;
    _lstWidgets = _user!.role == 2
        ? [
            ConsumerHomeScreen(),
            MarketScreen(
              collection: "stations",
              switchScreen: linkScreen,
            ),
            WalletScreen(),
            ProfileScreen(),
            MoreScreen()
          ]
        : [
            BusinessHomeScreen(
              owner: _user,
              linkScreen: linkScreen,
            ),
            ProfileScreen(),
            DashboardScreen(
              owner: _user!,
            ),
            ProfileScreen(),
            MoreScreen()
          ];
  }

  void linkScreen(BuildContext context, Widget screen) {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    });
  }

  void switchTab(int index) {
    setState(() {
      widgetIndex = index;
    });
  }

  void showModal(BuildContext context, Widget modal) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return modal;
        });
  }

  void showCenterModal(BuildContext context, Widget dialog) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: dialog,
          );
        });
  }

  void _scan() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("QR Scanner")));
  }

  @override
  Widget build(BuildContext context) {
    var appBar;
    switch (_user!.role) {
      case 1:
        appBar = PreferredSize(
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
                Icons.business,
                color: themeDark.primaryColor,
                size: 40,
              )
            ],
          ),
        );
        break;
      case 2:
        appBar = PreferredSize(
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
        );
        break;
      case 3:
        appBar = PreferredSize(
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
        );
        break;
      default:
    }
    var navBarItems;
    switch (_user!.role) {
      case 1:
        navBarItems = [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.people), label: "Team"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
          const BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu")
        ];
        break;
      case 2:
        navBarItems = [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.local_gas_station), label: "Charge"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.wallet), label: "Wallet"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
          const BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu")
        ];
        break;
      case 3:
        navBarItems = [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.people), label: "Team"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
          const BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu")
        ];
        break;
    }
    var floatingActionButton;
    switch (_user!.role) {
      case 1:
        floatingActionButton = FloatingActionButton(
          onPressed: _scan,
          tooltip: 'Scan',
          child: const Icon(Icons.qr_code_scanner_rounded,
              color: Color(colorPrimaryDarkBrand)),
        );
        break;
      case 2:
        floatingActionButton = FloatingActionButton(
          onPressed: _scan,
          tooltip: 'Scan',
          child: const Icon(Icons.qr_code_scanner_rounded,
              color: Color(colorPrimaryDarkBrand)),
        );
        break;
    }
    return Scaffold(
      appBar: appBar,
      body: _lstWidgets[widgetIndex],
      bottomNavigationBar: BottomNavBar(
        items: navBarItems,
        selectedItem: 0,
        switchTab: switchTab,
      ),
      floatingActionButton:
          floatingActionButton, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
