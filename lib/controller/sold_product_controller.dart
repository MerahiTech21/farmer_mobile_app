// /farmer/farmerHome/soldProduct/2

import 'package:coldroom_product_management/models/sold_product.dart';
import 'package:coldroom_product_management/services/api_base_helper.dart';
import 'package:coldroom_product_management/services/storage_management.dart';

ApiBaseHelper apiBaseHelper = ApiBaseHelper();

Future<List<SoldProduct>> fetchSoldProducts() async {
  var token = StorageManager.readData("token");
  var id = StorageManager.readData('userId');
  
  List<SoldProduct> withdraws = [];
  final response =
      await apiBaseHelper.get(url: '/farmer/farmerHome/soldProduct/$id');
  List soldProductResponse = response as List;
  for (int i = 0; i < soldProductResponse.length; i++) {
    Map<String, dynamic> map = soldProductResponse[i];
    withdraws.add(SoldProduct.fromJson(map));
  }
  return withdraws;
}
