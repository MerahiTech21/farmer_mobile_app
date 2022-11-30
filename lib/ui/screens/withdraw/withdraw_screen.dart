import 'package:coldroom_product_management/controller/withdraw_controller.dart';
import 'package:coldroom_product_management/models/withdraw.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'components.dart/withdraw_item_card.dart';

class WithdrawPage extends StatelessWidget {
  static const String routeName = "/withdraw";
  const WithdrawPage({Key? key}) : super(key: key);

// FutureBuilder(
//             future: fetchSummary(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasError) {
//                   return const Center(
//                     child: Text('Faild to load data'),
//                   );
//                 } else if (snapshot.hasData) {
//                   Summary summary = snapshot.data as Summary;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Withdraw"),
      ),
      body: FutureBuilder(
          future: fetchWithdraws(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(child: Text('Faild to load data'));
              } else if (snapshot.hasData) {
                List<Withdraw> withdraws = snapshot.data as List<Withdraw>;
                int totalWithdraw = withdraws
                    .map((item) => item.balance)
                    .reduce((sum, item) => sum + item);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.2,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Countup(
                                  begin: 0,
                                  end: totalWithdraw.toDouble(),
                                  duration: const Duration(seconds: 2),
                                  separator: ',',
                                  prefix: 'Birr ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 24),
                                ),
                                const Text(
                                  "Total Withdraw",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          "Withdraws",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ...withdraws
                            .map((item) => WithdrawItemCart(
                                  amount: item.balance,
                                  date:
                                      "${item.dateTime.day}/${item.dateTime.month}/${item.dateTime.year}",
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
