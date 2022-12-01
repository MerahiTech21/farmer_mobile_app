import 'package:coldroom_product_management/controller/summary_controller.dart';
import 'package:coldroom_product_management/models/summary.dart';
import 'package:coldroom_product_management/ui/screens/account/account.dart';
import 'package:coldroom_product_management/ui/screens/my_produce/my_produce.dart';
import 'package:coldroom_product_management/ui/screens/sold_produce/sold_produce.dart';
import 'package:coldroom_product_management/ui/screens/withdraw/withdraw_screen.dart';
import 'package:coldroom_product_management/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'components/summary.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: null,
          title: const Text("Rensys Coldroom"),
        ),
        body: FutureBuilder(
            future: fetchSummary(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Faild to load data'),
                  );
                } else if (snapshot.hasData) {
                  Summary summary = snapshot.data as Summary;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        SummaryComponent(
                          balance: summary.balance,
                          productInStore: summary.productInstore,
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        Container(
                            color: kSecondaryColor,
                            height: size.width,
                            child: Center(
                              child: GridView.extent(
                                  primary: false,
                                  padding: const EdgeInsets.all(16),
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  maxCrossAxisExtent: size.width * 0.4,
                                  children: <Widget>[
                                    MenuItem(
                                      lable: "My Produce",
                                      icon: FontAwesomeIcons.database,
                                      onClick: () => {
                                        Navigator.pushNamed(
                                            context, MyProduce.routeName)
                                      },
                                    ),
                                    MenuItem(
                                      lable: "Sold Produce",
                                      icon: FontAwesomeIcons.cartFlatbed,
                                      onClick: () => {
                                        Navigator.pushNamed(
                                            context, SoldProduce.routeName)
                                      },
                                    ),
                                    MenuItem(
                                      lable: "Withdraw",
                                      icon: FontAwesomeIcons.cashRegister,
                                      onClick: () => {
                                        Navigator.pushNamed(
                                            context, WithdrawPage.routeName)
                                      },
                                    ),
                                    MenuItem(
                                      lable: "Account",
                                      icon: FontAwesomeIcons.userLarge,
                                      onClick: () => {
                                        Navigator.pushNamed(
                                            context, Account.routeName)
                                      },
                                    )
                                  ]),
                            )),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  );
                }
              }

              return const Center(
                child: CircularProgressIndicator(color: kPrimaryColor,),
              );
            })

        //  Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //   child: Column(
        //     children: [
        //        Summary(),
        //       const Spacer(
        //         flex: 2,
        //       ),
        //       Container(
        //           color: kSecondaryColor,
        //           height: size.width,
        //           child: Center(
        //             child: GridView.extent(
        //                 primary: false,
        //                 padding: const EdgeInsets.all(16),
        //                 crossAxisSpacing: 20,
        //                 mainAxisSpacing: 20,
        //                 maxCrossAxisExtent: size.width * 0.4,
        //                 children: <Widget>[
        //                   MenuItem(
        //                     lable: "My Produce",
        //                     icon: FontAwesomeIcons.database,
        //                     onClick: () => {
        //                       Navigator.pushNamed(context, MyProduce.routeName)
        //                     },
        //                   ),
        //                   MenuItem(
        //                     lable: "Sold Produce",
        //                     icon: FontAwesomeIcons.cartFlatbed,
        //                     onClick: () => {
        //                       Navigator.pushNamed(context, SoldProduce.routeName)
        //                     },
        //                   ),
        //                   MenuItem(
        //                     lable: "Withdraw",
        //                     icon: FontAwesomeIcons.cashRegister,
        //                     onClick: () => {
        //                       Navigator.pushNamed(context, Withdraw.routeName)
        //                     },
        //                   ),
        //                   MenuItem(
        //                     lable: "Account",
        //                     icon: FontAwesomeIcons.userLarge,
        //                     onClick: () => {},
        //                   )
        //                 ]),
        //           )),
        //       const Spacer(
        //         flex: 2,
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}

class MenuItem extends StatelessWidget {
  final String lable;
  final IconData icon;
  dynamic onClick;
  MenuItem({
    required this.lable,
    required this.icon,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onClick()},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
              size: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              lable,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
