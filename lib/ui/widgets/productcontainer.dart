import 'package:flutter/material.dart';
import 'package:shop_delivery/global.dart';
import 'package:shop_delivery/ui/screens/about.dart';
import 'package:shop_delivery/ui/screens/details.dart';
import 'package:shop_delivery/ui/screens/feature.dart';
import 'package:shop_delivery/ui/screens/hygine.dart';
import 'package:shop_delivery/ui/screens/partybooking.dart';
import 'package:shop_delivery/ui/screens/scan.dart';
// import 'package:shop_delivery/ui/screens/myform.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductContainer extends StatelessWidget {
  final int id;

  const ProductContainer({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (id) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => About(id: id)),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PartyBooking(id: id)),
            );
            break;
          case 5:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Feature(id: id)),
            );
            break;
          case 6:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Hygine(
                        id: id,
                      )),
            );
            break;
          case 7:
            _onTapLink("http://freenulledcode.in/myform/HQ.pdf");
            break;
          default:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsScreen(id: id)),
            );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //            Padding(
            //              padding: const EdgeInsets.all(8.0),
            //              child: Text(
            //                "${productsList[id].price}",
            //                style: Theme.of(context).textTheme.title.copyWith(
            //                      color: Colors.white,
            //                    ),
            //              ),
            //            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: '$id',
                  child: Image.asset(
                    "${productsList[id].img}",
                    fit: BoxFit.cover, height: 90, width: 90,
                    // width: double.infinity,
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 1.0,
            // ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(188, 158, 70, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(9.0),
                ),
              ),
              child: Text(
                "${productsList[id].title}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle
                    .copyWith(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Future _onTapLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
