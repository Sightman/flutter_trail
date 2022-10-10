import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_trail/branding.dart';
import 'package:flutter_trail/business.dart';
import 'package:flutter_trail/preview_card.dart';

class Home extends StatelessWidget {
  static List<dynamic>? json;
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jsonBusinesses = [
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
            "vkontake": "alvyss"
          }
        ]
      },
      {
        "id": 2,
        "name": "MSA Solutions, S. A. de C. V.",
        "brand": "CEDi",
        "tag-line": "",
        "one-liner": "",
        "industry": "Information Technologies",
        "slogan": "",
        "logo-url": "",
        "social-media": [
          {"linkedin": "", "instagram": "", "facebook": "", "vkontake": ""}
        ]
      },
      {
        "id": 3,
        "name": "Edición Digital",
        "brand": "EDigital",
        "tag-line": "",
        "one-liner": "",
        "industry": "Video Production",
        "slogan": "Contamos tu historia",
        "logo-url":
            "https://ifei.com.mx/wp-content/uploads/edigital-logo-url.png",
        "social-media": [
          {
            "linkedin": "",
            "instagram": "edigital",
            "facebook": "",
            "vkontake": ""
          }
        ]
      }
    ];
    //getJSON('test/businesses.json');
    var lstCardPartners = setBusinesses(jsonBusinesses)
        .map((business) => PreviewCard(
              key: Key(business.id.toString()),
              strCardImage: business.logoURL,
              strOverlayTitle: business.brand,
              iconOverlayTopRight: Icons.business,
              boolOverlayTopRightIcon: true,
              strBottomBarTitle: business.slogan,
            ))
        .toList();
    final contPartnersMoreLink = Container(
      key: const Key('partners_more_link'),
      margin: const EdgeInsets.only(top: 10.0, left: 460.0, right: 10.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text('Todos'),
        Icon(
          Icons.more_horiz_rounded,
          color: Color(colorForegroundDarkDefault),
          size: 40,
        )
      ]),
    );
    final contMembersMoreLink = Container(
      key: const Key('partners_more_link'),
      margin: const EdgeInsets.only(top: 10.0, left: 427.0, right: 10.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text('Todos'),
        Icon(
          Icons.more_horiz_rounded,
          color: Color(colorForegroundDarkDefault),
          size: 40,
        )
      ]),
    );
    var rowPartnersMenu =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        key: const Key('container-partners'),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(top: 0, bottom: 20),
        alignment:
            AlignmentGeometry.lerp(Alignment.topLeft, Alignment.topRight, 1),
        //padding: EdgeInsetsGeometry.infinity,
        //constraints: const BoxConstraints(maxHeight: 200),
        //height: 200,
        color: Colors.blue.shade500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Partners',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    height: 4,
                    leadingDistribution: TextLeadingDistribution.even,
                    fontSize: 25,
                    fontFamily: 'M PLUS Round 1c',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    package: 'flutter_trail'),
              ),
              contPartnersMoreLink
            ]),
            Row(children: lstCardPartners.cast())
          ],
        ),
      ),
    ]);
    var rowMembersMenu = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          key: const Key('container-members'),
          margin: const EdgeInsets.only(bottom: 10),
          alignment:
              AlignmentGeometry.lerp(Alignment.topLeft, Alignment.topRight, 1),
          //constraints: const BoxConstraints(maxHeight: 200),
          //height: 200,
          color: Colors.blueGrey.shade300,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Community',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black87,
                            height: 4,
                            leadingDistribution: TextLeadingDistribution.even,
                            fontSize: 25,
                            fontFamily: 'M PLUS Round 1c',
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            package: 'flutter_trail'),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [contMembersMoreLink],
                      )
                    ]))
          ]),
        )
      ],
    );
    var colMainMenu = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [rowPartnersMenu, rowMembersMenu],
    );
    //throw UnimplementedError();
    return colMainMenu;
  }

  Future<void> getJSON(String url) async {
    final String payload = await rootBundle.loadString(url);
    json = jsonDecode(payload) as List<dynamic>;
    //return json;
  }

  List<Business> setBusinesses(List<dynamic> json) {
    final businesses = json;
    List<Business> arrBusinesses =
        businesses.map((business) => Business.fromJSON(business)).toList();
    return arrBusinesses;
  }
}
