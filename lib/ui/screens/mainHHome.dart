import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_delivery/ui/screens/scan.dart';
import 'package:shop_delivery/ui/widgets/productcontainer.dart';
import '../../global.dart';
import 'myform.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: <Widget>[
              Container(
                width: 50,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/head.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                title: Text(
                  'Share App',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ListTile(
                title: Text(
                  'Feedback',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.rate_review,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ListTile(
                title: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'headquater@gmail.com\n+917309400000',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.rate_review,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromRGBO(188, 158, 70, 1),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Headquarter",
        ),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.qrcode,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_active,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset(
                "assets/img/head.png",
                fit: BoxFit.cover, width: 150,
                // width: double.infinity,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
//              onTap: () => _onTapLink("http://freenulledcode.in/myform/"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Myform()));
              },
              child: Center(
                child: Image.asset(
                  "assets/img/member.png",
                  fit: BoxFit.cover, width: 180,
                  // width: double.infinity,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "Our Services",
                style: Theme.of(context).textTheme.title.apply(
                    fontWeightDelta: 2, color: Color.fromRGBO(188, 158, 70, 1)),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: .7),
              itemCount: productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductContainer(id: index);
              },
            ),
            SizedBox(
              height: 11,
            ),
          ],
        ),
      ),

    );
  }
}