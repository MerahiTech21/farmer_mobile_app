import 'package:coldroom_product_management/services/storage_management.dart';
import 'package:coldroom_product_management/splashscreen.dart';
import 'package:coldroom_product_management/ui/screens/account/account.dart';
import 'package:coldroom_product_management/ui/screens/home/home_page.dart';
import 'package:coldroom_product_management/ui/screens/login/login.dart';
import 'package:coldroom_product_management/utils/constants.dart';
import 'package:coldroom_product_management/utils/routers.dart';
import 'package:flutter/material.dart';
import './utils/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Coldroom management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: kSecondaryColor,
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 16),
            bodyText2: TextStyle(
              fontSize: 18,
            ),
          ).apply(
              // bodyColor: Colors.orange,
              // displayColor: Colors.blue,
              ),
          appBarTheme: const AppBarTheme(
            color: kPrimaryColor,
          ),
        ),
        home: SplashScreen(),
        // initialRoute:
        //     tryToLogin() != null ? HomePage.routeName : Login.routeName,
        routes: routes);
  }
}
