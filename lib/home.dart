import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_trail/avatar.dart';
import 'package:flutter_trail/avatar_list.dart';
import 'package:flutter_trail/branding.dart';
import 'package:flutter_trail/business.dart';
import 'package:flutter_trail/card_image.dart';
import 'package:flutter_trail/horizontal_card_list.dart';
import 'package:flutter_trail/persistent_banner.dart';
import 'package:flutter_trail/preview_card.dart';
import 'package:flutter_trail/review.dart';
import 'package:flutter_trail/review_list.dart';

class Home extends StatelessWidget {
  static List<dynamic>? json;
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getJSON('test/businesses.json');
    var jsonBusinesses = json ??
        [
          {
            "id": 1,
            "name": "Alsmid S. A. S. de C. V.",
            "brand": "Alvyss",
            "tag-line": "Smart Community Manager",
            "one-liner": "Inbound marketing tracker",
            "industry": "Information Technologies",
            "slogan": "Imagine, share, learn, expand",
            "logo-url":
                "https://my.alvyss.com/api/v1/cloudron/avatar?2395601373707481",
            "social-media": [
              {
                "linkedin": "alvyss",
                "instagram": "alvyss.it",
                "facebook": "alvyss.it",
                "twitter": "AlvyssIT",
                "vkontake": "alvyss"
              }
            ]
          },
          {
            "id": 2,
            "name": "Alsmid S. A. S. de C. V.",
            "brand": "Alsmid",
            "tag-line": "",
            "one-liner": "",
            "industry": "Science, Technology and Engineering",
            "slogan": "",
            "logo-url": null,
            "social-media": [
              {
                "linkedin": "alsmid",
                "instagram": "alsmid.iot",
                "facebook": "alsmid.iot",
                "twitter": "AlsmidIoT",
                "vkontake": ""
              }
            ]
          },
          {
            "id": 3,
            "name": "Wow24",
            "brand": "Wow24",
            "tag-line": "Digital Business Cards",
            "one-liner": "",
            "industry": "Information Technology",
            "slogan": "Digital Empowerment",
            "logo-url":
                "https://wow24.mx/wp-content/uploads/2021/11/Logo-WOW24-Final-Black-Small.png",
            "social-media": [
              {"linkedin": "", "instagram": "", "facebook": "", "vkontake": ""}
            ]
          }
        ];
    final arrMoments = [
      {'id': 1, 'name': 'noe.alvyss', 'photo-url': ''},
      {
        'id': 2,
        'name': 'marco.wow24',
        'photo-url':
            'https://wow24.mx/active/wow24marco/wp-content/uploads/2022/05/Marco-Circle-2-1536x1536.png'
      }
    ];
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
    var arrReviews = [
      {
        "fullname": "Noé Muñoz",
        "adscription": "CEO at Alsmid",
        "comment": "So efficient",
      },
      {
        "fullname": "Jane Doe",
        "adscription": "CIO at Alsmid",
        "comment": "Useful"
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
    var lstCardPartners = jsonBusinesses
        .map((business) => PreviewCard(
              key: Key(business['id'].toString()),
              strCardImage: business['logo-url'] != null
                  ? business['logo-url'].toString()
                  : "https://my.alvyss.com/api/v1/cloudron/avatar?2395601373707481",
              strOverlayTitle: business['brand'].toString(),
              iconOverlayTopRight: Icons.business,
              boolOverlayTopRightIcon: true,
              strBottomBarTitle: business['slogan'].toString(),
            ))
        .toList();
    //getJSON('test/users.json');
    var contMomentsMenu = Container(
      color: Colors.blueGrey,
      margin: const EdgeInsets.only(top: 180, bottom: 5),
      child: AvatarList(
        children: [
              const Avatar(
                name: 'Crear',
                foreground: Colors.black,
              )
            ] +
            arrMoments
                .map((moment) => Avatar(
                      photoURL: moment['photo-url'] != null
                          ? moment['photo-url'].toString()
                          : "https://ifei.com.mx/wp-content/uploads/Comunidad-Empresarial_icon.png",
                      name: moment['name'].toString(),
                      background: Colors.blueGrey.shade900,
                    ))
                .toList()
                .cast(),
      ),
    );
    var contPartnersMenu = Container(
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: HorizontalCardList(
        title: 'Partners',
        topRightButtonLabel: 'Todos',
        topRightButtonBackground: const Color(colorHighlightDark),
        topRightButtonIcon: Icons.more_horiz_rounded,
        backwardButtonIcon: Icons.arrow_back_rounded,
        forwardButtonIcon: Icons.arrow_forward_rounded,
        background: Colors.blue.shade500,
        children: lstCardPartners.cast(),
      ),
    );
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
    var contReviewList = Container(
        margin: const EdgeInsets.all(5.0),
        height: 400.0,
        child: ReviewList(
            children: arrReviews
                .map((e) => Review(
                      avatar: Avatar(
                        name: e['fullname'].toString(),
                        background: Colors.transparent,
                      ),
                      title: e['adscription'],
                      comment: e['comment'].toString(),
                    ))
                .toList()));
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
      PersistentBanner(
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
              arrMoments
                  .map((moment) => Avatar(
                        photoURL: moment['photo-url'] != null
                            ? moment['photo-url'].toString()
                            : 'https://ifei.com.mx/wp-content/uploads/Comunidad-Empresarial_icon.png',
                        name: moment['name'].toString(),
                        background: Colors.blueGrey.shade900,
                      ))
                  .toList()
                  .cast(),
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
      ),
      contLstCardSlides,
    ]);
  }

  Future<void> getJSON(String url) async {
    try {
      final String payload = await rootBundle.loadString(url);
      json = jsonDecode(payload) as List<dynamic>;
    } catch (e) {
      Dialog(
        child: Text(e.toString()),
      );
    }
    //return json;
  }

  List<Business> setBusinesses(List<dynamic> json) {
    final businesses = json;
    List<Business> arrBusinesses =
        businesses.map((business) => Business.fromJSON(business)).toList();
    return arrBusinesses;
  }
}
