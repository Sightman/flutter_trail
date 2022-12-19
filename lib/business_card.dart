import 'package:flutter/material.dart';
import 'package:flutter_trail/horizontal_card_list.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    var arrSlides = [
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
    var arrImgSlides = arrSlides
        .map((e) => Container(
              height: 800,
              width: 450,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(e['photo-url'].toString()))),
            ))
        .toList();
    var contImgSlider = SizedBox(
      height: 835,
      width: 450,
      child: HorizontalCardList(title: '', height: 800, children: arrImgSlides),
    );
    var lstVerticalSlider = ListView(
      children: [contImgSlider],
    );
    return lstVerticalSlider;
  }
}
