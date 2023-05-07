import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_trail/avatar.dart';
import 'package:flutter_trail/avatar_list.dart';
import 'package:flutter_trail/branding.dart';
import 'package:flutter_trail/models/business.dart';
import 'package:flutter_trail/card_image.dart';
import 'package:flutter_trail/horizontal_card_list.dart';
import 'package:flutter_trail/models/user.dart';
import 'package:flutter_trail/persistent_banner.dart';
import 'package:flutter_trail/preview_card.dart';
import 'package:flutter_trail/review_widget.dart';
import 'package:flutter_trail/review_list.dart';

import 'models/review.dart';
import 'src/requestor.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  _HomeState();
  String? _host;
  String? _root;
  late Future<List<dynamic>> _jsonUsers;
  late Future<List<dynamic>> _jsonBusinesses;
  late Future<List<dynamic>> _jsonReviews;

  @override
  void initState() {
    super.initState();
    _host = dotenv.env['HOST'];
    _root = dotenv.env['ROOT'];
    _jsonUsers = Requestor().arrayFromAssets('$_root/test/users.json');
    _jsonBusinesses =
        Requestor().arrayFromAssets('$_root/test/businesses.json');
    _jsonReviews = Requestor().arrayFromAssets('$_root/test/reviews.json');
  }

  @override
  Widget build(BuildContext context) {
    var arrPlaces = [
      {
        'id': 1,
        'name': 'Ciudad de México',
        'author': 'Andres Ordaz Vega',
        'photo-url':
            'https://www.pexels.com/es-es/foto/ciudad-amanecer-puesta-de-sol-rascacielos-12854629/'
      },
      {
        'id': 2,
        'name': 'Guadalajara',
        'author': 'Fernando  Paleta',
        'photo-url':
            'https://www.pexels.com/es-es/foto/punto-de-referencia-panorama-urbano-edificios-oficina-12468084/'
      },
      {
        'id': 3,
        'name': 'Cholula',
        'author': 'Felipe Perez',
        'photo-url':
            'https://www.pexels.com/es-es/foto/la-iglesia-y-el-volcan-12282043/'
      },
      {
        'id': 4,
        'name': 'Cancún',
        'author': 'Daniela Velarde',
        'photo-url':
            'https://www.pexels.com/es-es/foto/paisaje-punto-de-referencia-edificio-historico-5703115/'
      },
      {
        'id': 5,
        'name': 'Roma',
        'author': 'Heinz Klier',
        'photo-url':
            'https://www.pexels.com/es-es/foto/foto-de-la-estatua-durante-el-dia-3124764/'
      }
    ];
    var arrBannerSlides = [
      {
        "id": 1,
        "photo-url":
            "https://wow24.mx/active/wow24marco/wp-content/uploads/2022/05/Traveler-Smartphone.jpg"
      },
      {
        "id": 2,
        "photo-url":
            "https://wow24.mx/active/wow24marco/wp-content/uploads/2022/05/Business-Man-Smartphone-2-1.jpg"
      },
      {
        "id": 3,
        "photo-url":
            "https://wow24.mx/active/wow24marco/wp-content/uploads/2022/05/Business-Woman-Smartphone-2-2.jpg"
      },
      {
        "id": 4,
        "photo-url":
            "https://wow24.mx/active/wow24marco/wp-content/uploads/2022/05/Musician-Smartphone.jpg"
      },
      {
        "id": 5,
        "photo-url":
            "https://wow24.mx/active/wow24marco/wp-content/uploads/2022/05/Photographer-3-Smartphone.jpg"
      }
    ];
    //getJSON('test/users.json');
    var contMomentsMenu = FutureBuilder<List<dynamic>>(
        future: _jsonUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<User> data = User.static().mapJSON(snapshot.data!);
            return Container(
              color: Colors.blueGrey,
              margin: const EdgeInsets.only(top: 180, bottom: 5),
              child: AvatarList(
                children: [
                      const Avatar(
                        photoURL:
                            'https://cdn2.iconfinder.com/data/icons/instagram-40/98/Asset_47-256.png',
                        name: 'Crear',
                        foreground: Colors.black,
                      )
                    ] +
                    data
                        .map((moment) => Avatar(
                              photoURL: moment.photoURL,
                              name: moment.username,
                              background: Colors.blueGrey.shade900,
                            ))
                        .toList(),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Some data couldn't be retrieved."),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
    var contPartnersMenu = FutureBuilder<List<dynamic>>(
        future: _jsonBusinesses,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Business> data =
                Business.static().mapJSON(snapshot.data!);
            return Container(
              margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: HorizontalCardList(
                title: 'Partners',
                topRightButtonLabel: 'Todos',
                topRightButtonBackground: const Color(colorHighlightDark),
                topRightButtonIcon: Icons.more_horiz_rounded,
                backwardButtonIcon: Icons.arrow_back_rounded,
                forwardButtonIcon: Icons.arrow_forward_rounded,
                background: Colors.blue.shade500,
                children: data
                    .map((business) => PreviewCard(
                          key: Key(business.id.toString()),
                          strCardImage: business.logoURL,
                          strOverlayTitle: business.brand,
                          iconOverlayTopRight: Icons.business,
                          boolOverlayTopRightIcon: true,
                          strBottomBarTitle: business.slogan,
                        ))
                    .toList(),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("Some data could't be retrieved."));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
    var contMembersMenu = Container(
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: HorizontalCardList(
        title: 'Comunidad',
        topRightButtonLabel: 'Todos',
        topRightButtonBackground: const Color(colorHighlightDark),
        topRightButtonIcon: Icons.more_horiz_rounded,
        backwardButtonIcon: Icons.arrow_back_rounded,
        forwardButtonIcon: Icons.arrow_forward_rounded,
        background: Colors.blue.shade300,
      ),
    );
    var contReviewList = FutureBuilder<List<dynamic>>(
        future: _jsonReviews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Review> data = Review.static().mapJSON(snapshot.data!);
            return Container(
                margin: const EdgeInsets.all(5.0),
                height: 400.0,
                child: ReviewList(
                    children: data
                        .map((e) => ReviewWidget(
                              avatar: Avatar(
                                name: e.fullname,
                                background: Colors.transparent,
                                photoURL: e.photoURL,
                              ),
                              title: e.adscription,
                              comment: e.comment,
                            ))
                        .toList()));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Some data couldn't be retrieved."),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
    var colMainMenu = ListView(
      children: [
        contMomentsMenu,
        contPartnersMenu,
        contMembersMenu,
        contReviewList
      ],
    );
    var contLstCardSlides = SizedBox(
        height: 350,
        child: HorizontalCardList(
            height: 210,
            title: '',
            topRightButtonLabel: '',
            background: Colors.transparent,
            children: arrBannerSlides
                .map((slide) => CardImage(
                    image: NetworkImage(slide['photo-url'] != null
                        ? slide['photo-url'].toString() == ''
                            ? "https://unsplash.com/es/fotos/nEwLb1onsDo"
                            : slide['photo-url'].toString()
                        : "https://imgur.com/8m1tosq")))
                .toList()));
    return Stack(children: [
      colMainMenu,
      FutureBuilder<List<dynamic>>(
          future: _jsonUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<User> data = User.static().mapJSON(snapshot.data!);
              return PersistentBanner(
                title: 'My Flutter learning path',
                leading: const Image(image: NetworkImage(imgLogoBrand)),
                flexibleSpace: AvatarList(
                  title: '',
                  background: const Color(colorForegroundDarkDefault),
                  children: [
                        const Avatar(
                          name: 'Crear',
                          background: Color(0x50ffffff),
                          foreground: Colors.black,
                        )
                      ] +
                      data
                          .map((moment) => Avatar(
                                photoURL: moment.photoURL,
                                name: moment.username,
                                background: Colors.blueGrey.shade900,
                              ))
                          .toList(),
                ),
                actions: const [
                  Icon(
                    Icons.notifications_rounded,
                    color: Color(colorPrimaryDarkBrand),
                    size: 40,
                  ),
                  Icon(
                    Icons.account_circle_rounded,
                    color: Color(colorPrimaryDarkBrand),
                    size: 40,
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Some data couldn't be retrieved."),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      contLstCardSlides,
    ]);
  }
}
