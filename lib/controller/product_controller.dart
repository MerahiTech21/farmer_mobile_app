import 'package:coldroom_product_management/models/product.dart';
import 'package:coldroom_product_management/services/api_base_helper.dart';

ApiBaseHelper apiBaseHelper = ApiBaseHelper();

Future<List<Product>> fetchProducts() async {
  List<Product> products = [];
  final response = await apiBaseHelper.get(url: '/user/get_role_models');
  List productResponse = response['data'] as List;
  for (int i = 0; i < productResponse.length; i++) {
    Map<String, dynamic> map = productResponse[i];
    products.add(Product.fromJson(map));
  }
  return products;
}

