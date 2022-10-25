import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_trail/branding.dart';
import 'package:flutter_trail/business.dart';
import 'package:flutter_trail/preview_card.dart';

import 'package:flutter_trail/avatar.dart';
import 'package:flutter_trail/avatar_list.dart';
import 'package:flutter_trail/horizontal_card_list.dart';
import 'package:flutter_trail/persistent_banner.dart';
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
            "name": "Alvyss Company",
            "brand": "Alvyss",
            "tag-line": "Collaborative CAD tools",
            "one-liner":
                "Collaborative CAD application for architects and engineers",
            "industry": "Information Technologies",
            "slogan": "Imagine, share, learn, expand",
            "logo-url":
                "https://my.alvyss.com/api/v1/cloudron/avatar?2395601373707481",
            "social-media": [
              {
                "linkedin": "alvyss",
                "instagram": "alvyss.it",
                "facebook": "alvyss.it",
                "twitter": "AlvyssIoT",
                "vkontake": "alvyss"
              }
            ]
          },
          {
            "id": 2,
            "name": "Alsmid Company",
            "brand": "Alsmid",
            "tag-line": "",
            "one-liner": "",
            "industry": "Robotics",
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
            "name": "Katzenfeld Corporation",
            "brand": "Katzenfeld",
            "tag-line": "",
            "one-liner": "",
            "industry": "Film making",
            "slogan": "Watch, feel, lieve",
            "logo-url":
                "https://ifei.com.mx/wp-content/uploads/edigital-logo.png",
            "social-media": [
              {
                "linkedin": "",
                "instagram": "katzenfeld.corp",
                "facebook": "katzenfeld.corp",
                "vkontake": ""
              }
            ]
          }
        ];
    var lstCardPartners = jsonBusinesses
        .map((business) => PreviewCard(
              key: Key(business['id'].toString()),
              strCardImage: business['logo-url'] != null
                  ? business['logo-url'].toString()
                  : 'https://my.alvyss.com/api/v1/cloudron/avatar?2395601373707481',
              strOverlayTitle: business['brand'].toString(),
              iconOverlayTopRight: Icons.business,
              boolOverlayTopRightIcon: true,
              strBottomBarTitle: business['slogan'].toString(),
            ))
        .toList();
    //getJSON('test/users.json');
    final arrMoments = [
      {'id': 1, 'photo-url': '', 'name': 'noe.alvyss'},
      {'id': 2, 'photo-url': '', 'name': 'katzen.oli'}
    ];
    var contMomentsMenu = Container(
      color: Colors.blueGrey,
      margin: const EdgeInsets.only(top: 5, bottom: 5),
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
                          : 'https://ifei.com.mx/wp-content/uploads/Comunidad-Empresarial_icon.png',
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
        background: Colors.blue.shade300,
      ),
    );
    var arrReviews = [
      {
        "fullname": "Noé Muñoz",
        "adscription": "CEO at Alvyss",
        "comment": "So efficient",
      },
      {
        "fullname": "Jane Doe",
        "adscription": "CIO at Alvyss",
        "comment": "Usefull"
      }
    ];
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
    //throw UnimplementedError();
    return Stack(children: [
      colMainMenu,
      PersistentBanner(
        title: 'My Flutter learning path',
        leading: Image.network(imgLogoBrand),
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
      )
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
