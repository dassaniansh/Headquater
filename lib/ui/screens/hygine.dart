import 'package:flutter/material.dart';

import '../../global.dart';

class Hygine extends StatelessWidget {
  final int id;

  const Hygine({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Color.fromRGBO(58, 66, 26, 1),
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Hero(
                    tag: '$id',
                    child: Image.asset(
                      "${productsList[id].img}",
                      width: MediaQuery.of(context).size.width * .7,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "${productsList[id].title}",
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // Text(
                  //   "Description",
                  //   style: Theme.of(context).textTheme.title,
                  // ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'HEALTH AND HYGINE\n\nA message to our guests as we look to reopen our doors to the public.\nOur customers mean everything to us and we are committed to providing you with a safe and stress-free experience here at HEADQUARTER.\nWe are committed to providing you with the same delicious food and drinks in the safest and healthiest environment. For those of you who are not ready to dine in us just yet, you can call ahead and order items for takeout. Our guests and employees are an extension of our family and our business is nothing without our community.  We wish to thank you for your unwavering support during these unprecedented times.\nThis is by no means an exhaustive list but includes the following:\n\n1.All employees will follow strict hygiene protocols at all times.\n\n2. Hand sanitizer will be provided to all guests upon arrival prior to entering.\n\n3. All items from our suppliers will be inspected and sanitized.\n\n',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
