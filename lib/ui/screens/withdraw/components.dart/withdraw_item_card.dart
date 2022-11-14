import 'package:coldroom_product_management/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WithdrawItemCart extends StatelessWidget {
  String date;
  int amount;

  WithdrawItemCart({
    required this.date,
    required this.amount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Icon(
              FontAwesomeIcons.check,
              size: 24,
              color: kPrimaryColor,
            ),
            const Spacer(
              flex: 1,
            ),
            Text("Birr $amount",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Spacer(
              flex: 2,
            ),
            Text(date,
                style: const TextStyle(
                    fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.5))),
            // Spacer(
            //   flex: 2,
            // ),
          ]),
    );
  }
}
