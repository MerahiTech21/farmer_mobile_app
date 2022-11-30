import 'package:flutter/material.dart';

class ProduceTypeCard extends StatelessWidget {
  final String image;
  final String name;
  final int remainQty;
  final int soldQty;
  final DateTime addedDate;

  const ProduceTypeCard({
    required this.image,
    required this.name,
    required this.remainQty,
    required this.soldQty,
    required this.addedDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        isThreeLine: true,
        leading: ClipRRect(
          child: Image.network(
            image,
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Remain $remainQty Kg "), Text("Sold $soldQty Kg")],
        ),
        trailing:
            Text("${addedDate.day} /${addedDate.month}/${addedDate.year}"),
      ),
    );
  }
}
