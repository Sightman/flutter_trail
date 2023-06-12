import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '/forms/login.dart';
import '/src/requestor.dart';
import '/menus/persistent_banner.dart';
import '../menus/bottom_nav_bar.dart';
import '../themes/branding.dart';
import 'home.dart';

class WelcomeScreen extends StatefulWidget {
  String? title;
  Function? onLogin;
  WelcomeScreen({super.key, this.title, this.onLogin});

  @override
  State<StatefulWidget> createState() {
    return _WelcomeScreenState();
  }
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String? _title;
  late Future<List<dynamic>> _jsonSlides;
  Function? _onLogin;
  _WelcomeScreenState();
  @override
  void initState() {
    super.initState();
    _title = super.widget.title;
    _jsonSlides = Requestor().arrayFromAssets('test/slides.json');
    if (super.widget.onLogin != null) {
      _onLogin = super.widget.onLogin;
    }
  }

  void _contact() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Contact us"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var carouselSlider = FutureBuilder(
        future: _jsonSlides,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DecorationImage> lstImageSlides =
                (snapshot.data! as List<dynamic>)
                    .map((e) => DecorationImage(
                        image: NetworkImage(e['photo-url'].toString()),
                        fit: BoxFit.cover))
                    .toList();
            List<Container> contImageSlider = lstImageSlides
                .map((e) => Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(image: e),
                    ))
                .toList();
            return CarouselSlider(
                items: contImageSlider,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 1.0));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Some data couldn't be retrieved"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
    var contMainMenu = Container(
      margin: const EdgeInsets.only(top: 200.0),
      constraints: const BoxConstraints(minHeight: 100.0, maxHeight: 200.0),
      color: Colors.cyanAccent,
    );
    var navBarItems = const [
      BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard), label: "My Gitfcard"),
      BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "QR"),
      BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner), label: "QR Scanner"),
    ];
    var contSignupForm = Login(onLogin: _onLogin);
    return Scaffold(
      body: Stack(
        children: [
          Center(child: carouselSlider),
          PersistentBanner(
            leading: Image.network(imgLogoBrand),
            title: _title,
          ),
          contSignupForm
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        items: navBarItems,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _contact,
        tooltip: 'Help',
        child:
            const Icon(Icons.help_outline, color: Color(colorPrimaryDarkBrand)),
      ),
    );
  }
}
