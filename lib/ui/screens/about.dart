import 'package:flutter/material.dart';
// import 'package:shop_delivery/ui/widgets/counter.dart';

import '../../global.dart';

class About extends StatelessWidget {
  final int id;

  const About({Key key, this.id}) : super(key: key);
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
                      "assets/img/about.jpeg",
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
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'We pride ourselves in having an experienced and friendly service team, who together, treat the HEADQUARTER as an extension of our home,  where every guest is VIP.You can visit with friends and family and even with your business associates for meeting or business parties. There\'s everything for every one,we have a gamming area where you can play certains games like pool, with your friends and family .For ladies kitty parties we provide  event handler ,So if you\'r going to  have any parties just let us know Whether it be a brunch, luncheon, afternoon tapas, happy hour, dinner, corporate function or special wine dinner event we have the space (private rooms 2 and Pub and Dining room seating up to 40 Meeting area ,and Conference room.) with set or custom menus to suit a variety of occasions.',
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
