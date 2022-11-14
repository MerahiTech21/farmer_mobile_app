import 'package:coldroom_product_management/utils/string_extensions.dart';
import 'package:flutter/material.dart';

class TransactionItemCard extends StatelessWidget {
  String productName;
  String typeName;
  double soldPrice;
  int soldAmount;
  String date;

  TransactionItemCard({
    required this.productName,
    required this.typeName,
    required this.soldAmount,
    required this.soldPrice,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        // isThreeLine: true,
        title: Text(
          productName.capitalize(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: Image.asset("assets/images/download_5.jpg"),
        subtitle: Text(
          "Price Birr $soldPrice",
          style: const TextStyle(fontSize: 16),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "$soldAmount Kg",
              style: const TextStyle(fontSize: 14),
            ),
            const Spacer(),
            Text(date, style: const TextStyle(fontSize: 14))
          ],
        ),
      ),
    );
  }
}
