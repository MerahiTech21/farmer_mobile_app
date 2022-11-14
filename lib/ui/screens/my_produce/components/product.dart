import 'package:coldroom_product_management/models/product.dart';
import 'package:coldroom_product_management/utils/constants.dart';
import 'package:flutter/material.dart';
import 'product_type_card.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.myProduct,
  }) : super(key: key);

  final Product myProduct;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ExpansionTile(
        // backgroundColor: kSecondaryColor,
        // collapsedBackgroundColor: kSecondaryColor,
        backgroundColor: Colors.white,
        collapsedTextColor: Colors.black,
        textColor: Colors.black,

        leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              myProduct.image,
              fit: BoxFit.cover,
            )),
        title: Text(
          myProduct.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text('Rent Birr ${myProduct.rentPrice}'),
        trailing: Text("${myProduct.remainingQty} Kg"),
        
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(right: 50),
            child: Divider(
              color: kPrimaryColor,
              thickness: 2,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8, left: 20),
            child: Text(
              'Produce types remain in the store',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          ProduceTypeCard(
            image: "assets/images/download_5.jpg",
            name: "Tomato",
            remainQty: 200,
            soldQty: 200,
            addedDate: DateTime.now(),
          ),
          ProduceTypeCard(
            image: "assets/images/download_5.jpg",
            name: "Tomato",
            remainQty: 200,
            soldQty: 200,
            addedDate: DateTime.now(),
          ),
          ProduceTypeCard(
            image: "assets/images/download_5.jpg",
            name: "Tomato",
            remainQty: 200,
            soldQty: 200,
            addedDate: DateTime.now(),
          ),
        ],
      ),
    );
  }
}
