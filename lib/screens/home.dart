import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_trail/menus/bottom_nav_bar.dart';
import '/cards/avatar.dart';
import '/lists/avatar.dart';
import '/themes/branding.dart';
import '/models/business.dart';
import '/cards/image.dart';
import '/lists/horizontal_card.dart';
import '/models/user.dart';
import '/menus/persistent_banner.dart';
import '/cards/preview.dart';
import '/cards/review.dart';
import '/lists/review.dart';

import '../models/review.dart';
import '../src/requestor.dart';

class Home extends StatefulWidget {
  String? title;
  Home({Key? key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  String? _title;
  String? _host;
  String? _root;
  late Future<List<dynamic>> _jsonUsers;
  late Future<List<dynamic>> _jsonBusinesses;
  late Future<List<dynamic>> _jsonReviews;
  late Future<List<dynamic>> _jsonAds;
  late Future<List<dynamic>> _jsonSlides;
  _HomeState();

  @override
  void initState() {
    super.initState();
    _title = super.widget.title;
    _host = dotenv.env['HOST'];
    _root = dotenv.env['ROOT'];
    _jsonUsers = Requestor().arrayFromAssets('test/users.json');
    _jsonBusinesses = Requestor().arrayFromAssets('test/businesses.json');
    _jsonReviews = Requestor().arrayFromAssets('test/reviews.json');
    _jsonAds = Requestor().arrayFromAssets('test/ads.json');
    _jsonSlides = Requestor().arrayFromAssets('test/slides.json');
  }

  @override
  Widget build(BuildContext context) {
    var contAdsSlider = FutureBuilder<List<dynamic>>(
      future: _jsonAds,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Container> data = snapshot.data!
              .map(((e) => Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(e['photo-url'].toString()))))))
              .toList();
          return Container(
            margin: const EdgeInsets.only(top: 200, bottom: 5),
            height: 250,
            child: CarouselSlider(
                items: data, options: CarouselOptions(autoPlay: true)),
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
      },
    );
    var contMomentsMenu = FutureBuilder<List<dynamic>>(
        future: _jsonUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<User> data = User.static().mapJSON(snapshot.data!);
            return Container(
              color: Colors.blueGrey,
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              child: AvatarList(
                children: [
                      const AvatarWidget(
                        photoURL:
                            'https://cdn2.iconfinder.com/data/icons/instagram-40/98/Asset_47-256.png',
                        name: 'Crear',
                        foreground: Colors.black,
                      )
                    ] +
                    data
                        .map((moment) => AvatarWidget(
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
                              avatar: AvatarWidget(
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
        contAdsSlider,
        contMomentsMenu,
        contPartnersMenu,
        contMembersMenu,
        contReviewList
      ],
    );
    var contLstCardSlides = FutureBuilder(
        future: _jsonSlides,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var slides = snapshot.data! as List<dynamic>;
            return SizedBox(
                height: 350,
                child: HorizontalCardList(
                    height: 210,
                    title: '',
                    topRightButtonLabel: '',
                    background: Colors.transparent,
                    children: slides
                        .map((slide) => ImageCard(
                            image: NetworkImage(slide['photo-url'] != null
                                ? slide['photo-url'].toString() == ''
                                    ? "https://unsplash.com/es/fotos/nEwLb1onsDo"
                                    : slide['photo-url'].toString()
                                : "https://imgur.com/8m1tosq")))
                        .toList()));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Some data could't be retrieved"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
    var appBar = FutureBuilder<List<dynamic>>(
        future: _jsonUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<User> data = User.static().mapJSON(snapshot.data!);
            return PersistentBanner(
              title: _title,
              leading: const Image(image: NetworkImage(imgLogoBrand)),
              flexibleSpace: AvatarList(
                title: '',
                background: const Color(colorForegroundDarkDefault),
                children: [
                      const AvatarWidget(
                        name: 'Crear',
                        photoURL:
                            'https://cdn2.iconfinder.com/data/icons/instagram-40/98/Asset_47-256.png',
                        background: Color(0x50ffffff),
                        foreground: Colors.black,
                      )
                    ] +
                    data
                        .map((moment) => AvatarWidget(
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
        });
    var stackHome = Stack(children: [
      colMainMenu,
      appBar,
      //contLstCardSlides,
    ]);
    return Scaffold(
      body: stackHome,
    );
  }
}
