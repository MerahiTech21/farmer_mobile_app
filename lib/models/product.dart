import 'package:coldroom_product_management/models/product_type.dart';

class Product {
  int id;
  String image;
  String name;
  double remainingQty;
  DateTime createdAt;
  List<ProductType>? types = [];
  Product(
      {required this.image,
      required this.id,
      required this.name,
      required this.remainingQty,
      required this.createdAt,
      this.types});

  factory Product.fromJson(Map<String, dynamic> json) {
    // List<ProductType> productTypes = [];

    // List types = json['types'] as List;
    // for (int i = 0; i < types.length; i++) {
    //   Map<String, dynamic> map = json[i];
    //   productTypes.add(ProductType.fromJson(map));
    // }
    return Product(
        image: json["image"],
        id: json['id'],
        name: json["name"],
        // types: productTypes,
        remainingQty: json["remainingQuantity"].toDouble(),
        createdAt:DateTime.parse(json["createdAt"]) );
  }
}
