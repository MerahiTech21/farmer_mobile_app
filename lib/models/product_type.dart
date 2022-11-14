class ProductType {
  final String image;
  final String name;
  final double remainQty;
  final double soldQty;
  final DateTime addedDate;

  ProductType(
      {required this.image,
      required this.name,
      required this.remainQty,
      required this.soldQty,
      required this.addedDate});

  factory ProductType.fromJson(Map<String, dynamic> json) {
    return ProductType(
        image: json["image"],
        name: json["name"],
        remainQty: json["remainQty"],
        soldQty: json["soldQty"],
        addedDate: json["soldQty"]);
  }
}
