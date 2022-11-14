import 'package:coldroom_product_management/services/api_base_helper.dart';
import 'package:coldroom_product_management/services/storage_management.dart';
import 'package:http/http.dart';

ApiBaseHelper apiBaseHelper = ApiBaseHelper();

Future<Map<String, dynamic>> login(phoneNo, password) async {
  final response = await apiBaseHelper.post(
      url: '/farmer/auth/login',
      payload: {"phoneNumber": phoneNo, "password": password});

  return response;
}

Future<Map<String, dynamic>> fetchUserInfo() async {
  var token = StorageManager.readData("token");
  var id = StorageManager.readData("userId");
  final response =
      await apiBaseHelper.get(url: '/farmer/farmerProfile/${id}', token: token);
  return response;
}

Future logout() async {
  await apiBaseHelper.get(url: '/farmer/auth/logout');
  await StorageManager.deleteData("token");
  await StorageManager.deleteData("userId");
}
