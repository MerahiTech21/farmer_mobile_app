import 'package:coldroom_product_management/models/withdraw.dart';
import 'package:coldroom_product_management/services/api_base_helper.dart';

ApiBaseHelper apiBaseHelper = ApiBaseHelper();

Future<List<Withdraw>> fetchWithdraws() async {
  List<Withdraw> withdraws = [];
  final response = await apiBaseHelper.get(url: '/farmer/farmerHome/farmerWithDraw/1');
  List withdrawResponse = response as List;
  for (int i = 0; i < withdrawResponse.length; i++) {
    Map<String, dynamic> map = withdrawResponse[i];
    withdraws.add(Withdraw.fromJson(map));
  }
  return withdraws;
}
