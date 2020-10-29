import 'package:flutter/material.dart';
// import 'package:shop_delivery/ui/screens/mainScreen.dart';
import 'package:shop_delivery/ui/screens/profile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'mainHHome.dart';
import 'myOrder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _showpage = new MainHome();

  final MyProfile _fview = MyProfile();
  final MainHome _homePage = MainHome();
  final MyOrderScreen _myOrderScreen = MyOrderScreen();

  _pageChooser(int page) {
    switch (page) {
      case 0:
        return _homePage;
        break;
      case 2:
        return _myOrderScreen;
        break;
      case 3:
        return _fview;
        break;

      default:
        return new Container(
          child: new Center(
            child: new Text(
              "Coming Soon",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        color: Colors.black,
        activeColor: Colors.black,
        backgroundColor: Color.fromRGBO(188, 158, 70, 1),
        items: [
          TabItem(
            icon: Icons.home,
            title: 'Home',
          ),
          TabItem(icon: Icons.card_giftcard, title: 'Events'),
          TabItem(icon: Icons.book, title: 'My Order'),
          TabItem(icon: Icons.person_outline, title: 'My Profile'),
        ],
        initialActiveIndex: 0, //optional, default as 0
        onTap: (int i) {
          updateIndex(i);
        },
      ),
      body: _showpage,
    );
  }

  Future _onTapLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void updateIndex(int index) {
    setState(() {
      _showpage = _pageChooser(index);
    });
  }
}
