import 'package:coldroom_product_management/controller/product_controller.dart';
import 'package:coldroom_product_management/models/product.dart';
import 'package:coldroom_product_management/ui/screens/my_produce/product_type.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
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
                List<Product> myProducts = snapshoot.data as List<Product>;
                return ListView.builder(
                    itemCount: myProducts.length,
                    itemBuilder: (context, index) {
                      return ProductCard(myProduct: myProducts[index]);
                    });
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
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
