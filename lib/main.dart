import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/menus/bottom_nav_bar.dart';
import '/screens/welcome.dart';
import '/session_manager.dart';
import '/themes/branding.dart';
import '/flutter_trail.dart';
import '/screens/home.dart';

void main() async {
  String host;
  bool isLoggedin;
  dotenv;
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await dotenv.load(fileName: 'web/.env');
  } else if (Platform.isLinux) {
    await dotenv.load(fileName: 'linux/.env');
  } else if (Platform.isAndroid) {
    await dotenv.load(fileName: 'android/.env');
  } else if (Platform.isIOS) {
    await dotenv.load(fileName: 'ios/.env');
  }
  host = dotenv.env['HOST']!;
  isLoggedin = await SessionManager().validateSession();
  runApp(MyApp(
    host: host,
    theme: themeDark,
    isLoggedin: isLoggedin,
  ));
}

class MyApp extends StatelessWidget {
  String? host;
  ThemeData? theme;
  bool isLoggedin;
  MyApp({Key? key, this.host, this.theme, required this.isLoggedin})
      : super(key: key);

  void switchScreen(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screen));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Trail',
      theme: theme,
      home: isLoggedin
          ? FlutterTrail(title: 'My Flutter learning path')
          : WelcomeScreen(onLogin: switchScreen),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.host})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String host;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _title;
  int _counter = 0;
  String? _host;
  Widget? _home;
  _MyHomePageState();

  @override
  void initState() {
    super.initState();
    _title = super.widget.title;
    _host = dotenv.env['HOST'];
    _home = HomeScreen(title: _title);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var navBarItems = const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.event), label: "Calendar"),
      BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
      BottomNavigationBarItem(icon: Icon(Icons.people), label: "Contacts"),
      BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
    ];
    return Scaffold(
      /*
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leading: Image.network(
          "https://my.alvyss.com/api/v1/cloudron/avatar?2395601373707481",
          height: 50,
          width: 50,
        ),
        //const Icon(Icons.arrow_back, size: 30),
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: const Color(colorPrimaryDarkBrand),
        actions: const [
          Icon(
            Icons.notifications,
            size: 30,
          ),
          Icon(
            Icons.person,
            size: 30,
          )
        ],
        titleSpacing: 50,
        //flexibleSpace: Image.network("https://comunidad-empresarial.ediciondigital.mx/wp-content/uploads/slider6/presentacion5c16-9-03.png")
      ),*/
      body: _home,
      bottomNavigationBar: BottomNavBar(
        items: navBarItems,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add, color: Color(colorPrimaryDarkBrand)),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
