import 'package:coldroom_product_management/models/product.dart';
import 'package:coldroom_product_management/ui/screens/my_produce/product_type.dart';
import 'package:coldroom_product_management/utils/string_extensions.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.myProduct,
  }) : super(key: key);

  final Product myProduct;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: ListTile(
        onTap: () {
          print("product id😊");
          print(myProduct.id);
          Navigator.pushNamed(context, ProductTypeScreen.routeName,
              arguments: myProduct.id);
        },
        // backgroundColor: kSecondaryColor,
        // collapsedBackgroundColor: kSecondaryColor,
        // backgroundColor: Colors.white,
        // collapsedTextColor: Colors.black,
        textColor: Colors.black,

        leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              myProduct.image,
              width: 80,
              fit: BoxFit.cover,
            )),
        title: Text(
          myProduct.name.capitalize(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          'Rent Birr ${myProduct.rentPrice}',
          style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
        ),
        trailing: Text(
          "${myProduct.remainingQty} Kg",
          style: const TextStyle(fontSize: 14),
        ),

        // expandedCrossAxisAlignment: CrossAxisAlignment.start,
        // children: <Widget>[
        //   const Padding(
        //     padding: EdgeInsets.only(right: 50),
        //     child: Divider(
        //       color: kPrimaryColor,
        //       thickness: 2,
        //     ),
        //   ),
        //   const Padding(
        //     padding: EdgeInsets.only(top: 8.0, bottom: 8, left: 20),
        //     child: Text(
        //       'Produce types remain in the store',
        //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        //     ),
        //   ),
        //   ProduceTypeCard(
        //     image: "assets/images/download_5.jpg",
        //     name: "Tomato",
        //     remainQty: 200,
        //     soldQty: 200,
        //     addedDate: DateTime.now(),
        //   ),
        //   ProduceTypeCard(
        //     image: "assets/images/download_5.jpg",
        //     name: "Tomato",
        //     remainQty: 200,
        //     soldQty: 200,
        //     addedDate: DateTime.now(),
        //   ),
        //   ProduceTypeCard(
        //     image: "assets/images/download_5.jpg",
        //     name: "Tomato",
        //     remainQty: 200,
        //     soldQty: 200,
        //     addedDate: DateTime.now(),
        //   ),
        // ],
      ),
    );
  }
}
