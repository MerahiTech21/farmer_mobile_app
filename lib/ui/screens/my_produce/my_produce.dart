import 'package:coldroom_product_management/models/product.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'components/product.dart';

class MyProduce extends StatelessWidget {
  static const String routeName = "/my-product";
  MyProduce({Key? key}) : super(key: key);
  List<Product> myProducts = [
    Product(
        image: "assets/images/download_2.jpg",
        name: "Tomato",
        remainingQty: 200,
        rentPrice: 0.5),
    Product(
        image: "assets/images/download_2.jpg",
        name: "Onion",
        remainingQty: 200,
        rentPrice: 0.5),
    Product(
        image: "assets/images/download_5.jpg",
        name: "Strawberry",
        remainingQty: 200,
        rentPrice: 0.5),
    Product(
        image: "assets/images/download_4.jpg",
        name: "Banana",
        remainingQty: 200,
        rentPrice: 0.5),
    Product(
        image: "assets/images/download_5.jpg",
        name: "Orange",
        remainingQty: 200,
        rentPrice: 0.5)
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Produce"),
      ),
      body:
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

          ListView.builder(
              itemCount: myProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(myProduct: myProducts[index]);
              }),
    );
  }
}
