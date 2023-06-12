import 'package:flutter/material.dart';
import 'package:flutter_trail/cards/reward.dart';
import 'package:flutter_trail/models/user.dart';

class WalletScreen extends StatelessWidget {
  ThemeData? theme;
  User? user;
  WalletScreen({Key? key, this.theme, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String barcodeURL =
        "https://png.pngtree.com/png-clipart/20220402/ourmid/pngtree-black-and-white-icons-of-barcode-numbers-png-image_4520081.png";
    String qrcodeURL =
        "https://icon2.cleanpng.com/20180405/hpq/kisspng-qr-code-barcode-qrpedia-information-coder-5ac5a8de203920.063013681522903262132.jpg";
    var contRewardCard = Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: RewardCard(
        clientID: "0123456789",
        propietary: "John Doe",
      ),
    );
    var contBarcode = Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 200,
      child: Image(image: NetworkImage(barcodeURL)),
    );
    var contQRcode = Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 200,
      child: Image(image: NetworkImage(qrcodeURL)),
    );
    return ListView(
      children: [contRewardCard, contBarcode, contQRcode],
    );
  }
}
