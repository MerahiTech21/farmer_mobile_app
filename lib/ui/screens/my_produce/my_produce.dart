import 'package:coldroom_product_management/controller/product_controller.dart';
import 'package:coldroom_product_management/models/product.dart';
import 'package:coldroom_product_management/utils/constants.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'components/product.dart';

class MyProduce extends StatelessWidget {
  static const String routeName = "/my-product";
  MyProduce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Produce"),
      ),
      body: FutureBuilder(
          future: fetchProducts(),
          builder: (context, snapshoot) {
            if (snapshoot.connectionState == ConnectionState.done) {
              if (snapshoot.hasError) {
                return const Center(
                  child: Text("Faild to load data"),
                );
              } else if (snapshoot.hasData) {
                List myProducts = snapshoot.data as List<Product>;
                double totalProduce = myProducts.fold(0, (t, item) {
                  return item.remainingQty.toDouble() + t;
                });
                return SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.2,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Countup(
                                begin: 0,
                                end: totalProduce,
                                duration: const Duration(seconds: 2),
                                separator: ',',
                                suffix: ' Kg',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 24),
                              ),
                              const Text(
                                "Total Produce",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(0, 0, 0, 0.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "My Produce",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListView.builder(
                          itemCount: myProducts.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ProductCard(myProduct: myProducts[index]);
                          }),
                    ],
                  ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            );
          })
      // ListView.builder(
      //     itemCount: 6,
      //     itemBuilder: (context, index) {
      //       return SkeletonAnimation(
      //         child: Card(
      //           child: ListTile(
      //             leading: Container(
      //               height: 40,
      //               width: size.width * 0.15,
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(5.0),
      //                   color: Colors.grey[300]),
      //             ),
      //             title: Container(
      //               width: 50,
      //               height: 10,
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(5.0),
      //                   color: Colors.grey[300]),
      //             ),
      //             trailing: Container(
      //               width: 20,
      //               height: 10,
      //             ),
      //             subtitle: Container(
      //               // width: size.width * 0.12,
      //               // height: 5,
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(5.0),
      //                   color: Colors.grey[300]),
      //             ),
      //           ),
      //         ),
      //       );
      //     })

      ,
    );
  }
}
