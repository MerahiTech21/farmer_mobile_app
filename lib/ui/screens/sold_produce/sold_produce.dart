import 'package:coldroom_product_management/controller/sold_product_controller.dart';
import 'package:coldroom_product_management/models/sold_product.dart';
import 'package:coldroom_product_management/ui/screens/sold_produce/sold_product_detail.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';

import 'components/transactions_item_card.dart';

class SoldProduce extends StatelessWidget {
  static const String routeName = "/sold-produce";
  const SoldProduce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sold Produce"),
      ),
      body: FutureBuilder(
          future: fetchSoldProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Faild to load data'),
                );
              } else if (snapshot.hasData) {
                List<SoldProduct> soldProducts =
                    snapshot.data as List<SoldProduct>;

                double totalSold = soldProducts.fold(
                    0, (total, item) => total += item.soldAmount);

                return SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.3,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Countup(
                                  begin: 0,
                                  end: totalSold.toDouble(),
                                  duration: const Duration(seconds: 2),
                                  separator: ',',
                                  prefix: 'Birr ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 24),
                                ),
                                const Text(
                                  "Total sold",
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          "Transactions",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: soldProducts.length,
                            itemBuilder: (c, index) => GestureDetector(
                                  onTap: () => {
                                    Navigator.pushNamed(
                                        context, SoldProductDetail.routeName,
                                        arguments: soldProducts[index])
                                  },
                                  child: TransactionItemCard(
                                      productName:
                                          soldProducts[index].productName,
                                      typeName: soldProducts[index].typeName,
                                      soldPrice: soldProducts[index].soldPrice,
                                      soldAmount:
                                          soldProducts[index].soldAmount,
                                      date:
                                          '${soldProducts[index].date.day}/${soldProducts[index].date.month}/${soldProducts[index].date.year}'),
                                ))
                      ],
                    ),
                  ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
