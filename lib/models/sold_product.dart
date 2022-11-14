import 'dart:ffi';

class SoldProduct {
  String productName;
  String typeName;
  String? quality;
  int soldAmount;
  double soldPrice;
  double rentCost;
  DateTime date;
  double netBalance;

  SoldProduct(
      {required this.productName,
      required this.typeName,
      this.quality,
      required this.soldAmount,
      required this.soldPrice,
      required this.rentCost,
      required this.date,
      required this.netBalance});

  factory SoldProduct.fromJson(Map<String, dynamic> json) {
    return SoldProduct(
        productName:  json['productName'],
        typeName: json['typeName'],
        soldAmount: json['soldAmount'],
        soldPrice: json['soldPrice'].toDouble(),
        rentCost: json['rentCost'],
        date: DateTime.parse(json['date']),
        netBalance: json['netBalance']);
  }
}