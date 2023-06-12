import 'package:flutter/material.dart';

class RewardCard extends StatefulWidget {
  String? clientID;
  String? propietary;
  double? cash;
  double? points;
  RewardCard({Key? key, this.clientID, this.propietary, this.cash, this.points})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RewardCardState();
  }
}

class _RewardCardState extends State<RewardCard> {
  String clientID = "";
  String propietary = "";
  double cash = 0;
  double points = 0;
  _RewardCardState();
  @override
  void initState() {
    super.initState();
    clientID = super.widget.clientID ?? clientID;
    propietary = super.widget.propietary ?? propietary;
    cash = super.widget.cash ?? cash;
    points = super.widget.points ?? points;
  }

  @override
  Widget build(BuildContext context) {
    var contClientID = Container(
      margin: const EdgeInsets.only(top: 1, left: 1),
      child: Text(
        clientID,
        style: const TextStyle(
            color: Colors.white54, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
    var contPropietary = Container(
      margin: const EdgeInsets.only(bottom: 1, left: 1),
      child: Text(
        propietary,
        style: TextStyle(
            color: Colors.blue.shade50,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    );
    return Container(
      padding: const EdgeInsets.all(15),
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blueAccent.shade700),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [contClientID],
        ),
        Row(
          children: [contPropietary],
        )
      ]),
    );
  }
}
