import 'package:flutter/material.dart';
// import 'package:shop_delivery/ui/screens/details.dart';
import 'package:shop_delivery/ui/screens/home.dart';
import 'package:shop_delivery/ui/screens/orders.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OpenSans',
      ),
      home: SplashScreen.navigate(
        backgroundColor: Colors.white,
        name: 'assets/img/splash.flr',
        next: (context) => HomeScreen(),
        until: () => Future.delayed(Duration(seconds: 3)),
        startAnimation: 'Untitled',
      ),
      routes: {
        'orderscreen' : (ctx) => OrdersScreen()
      },
    );
  }
}
