import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_trail/bottom_nav_bar.dart';
import 'package:flutter_trail/branding.dart';
import 'package:flutter_trail/flutter_trail.dart';
import 'package:flutter_trail/home.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  String host;
  dotenv;
  if (kIsWeb) {
    await dotenv.load(fileName: '/web/.env');
  } else if (Platform.isLinux) {
    await dotenv.load(
        fileName: '/home/kanbalam/Projects/Multi/flutter_trail/linux/.env');
  } else if (Platform.isAndroid) {
    await dotenv.load(fileName: '/android/.env');
  }
  host = dotenv.env['HOST']!;
  runApp(MyApp(
    host: host,
  ));
}

class MyApp extends StatelessWidget {
  String? host;
  MyApp({Key? key, this.host}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Trail',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
        colorScheme: const ColorScheme(
            background: Color(colorBackgroundDarkDefault),
            primary: Color(colorPrimaryDarkBrand),
            secondary: Color(colorSecondaryDarkBrand),
            brightness: Brightness.dark,
            error: Colors.redAccent,
            surface: Colors.blue,
            onBackground: Color(colorForegroundDarkDefault),
            onPrimary: Colors.white,
            onSecondary: Colors.white70,
            onError: Colors.redAccent,
            onSurface: Colors.blue),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white24,
            selectedIconTheme: IconThemeData(color: Color(colorHighlightDark)),
            unselectedIconTheme:
                IconThemeData(color: Color(colorPrimaryDarkBrand)),
            selectedItemColor: Color(colorHighlightDark),
            unselectedItemColor: Color(colorPrimaryDarkBrand),
            type: BottomNavigationBarType.fixed),
        secondaryHeaderColor: Colors.transparent,
      ),
      home: FlutterTrail(title: 'My Flutter learning path'),
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
  int _counter = 0;
  String? _host;
  Widget? _home;
  _MyHomePageState();

  @override
  void initState() {
    super.initState();
    _host = dotenv.env['HOST'];
    _home = const Home();
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
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add, color: Color(colorPrimaryDarkBrand)),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
