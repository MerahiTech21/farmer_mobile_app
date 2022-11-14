import 'package:coldroom_product_management/models/summary.dart';
import 'package:coldroom_product_management/services/api_base_helper.dart';
import 'package:coldroom_product_management/services/storage_management.dart';

ApiBaseHelper apiBaseHelper = ApiBaseHelper();

Future<Summary> fetchSummary() async {
  var token = StorageManager.readData("token");
  var id = StorageManager.readData("userId");
  Summary summary;
  final response =
      await apiBaseHelper.get(url: '/farmer/farmerHome/1', token: token);

  summary = Summary.fromJson(response as Map<String, dynamic>);
  return summary;
}
