import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'menus/bottom_nav_bar.dart';
import 'screens/welcome.dart';
import 'themes/branding.dart';
import 'screens/home.dart';

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
  int widgetIndex = 0;
  _FlutterTrail();
  Widget _search() {
    return const SnackBar(
      content: Text("Buscar: "),
    );
  }

  @override
  void initState() {
    super.initState();
    _title = super.widget.title;
    _host = dotenv.env['HOST'];
    _lstWidgets = [Welcome(title: _title), Home(title: _title)];
  }

  @override
  Widget build(BuildContext context) {
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
      body: _lstWidgets[
          widgetIndex], /*
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: _search,
        tooltip: 'Search',
        child: const Icon(Icons.search, color: Color(colorPrimaryDarkBrand)),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
