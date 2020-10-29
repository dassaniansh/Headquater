import 'package:flutter/material.dart';

import '../../global.dart';

class Feature extends StatelessWidget {
  final int id;

  const Feature({Key key, this.id}) : super(key: key);
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
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'We Provide Pick And Drop Service That it\'s  easy to you to provide  pick and drop services at affordable rates. We always ensure that the customers who avail our services are always happy and satisfied. Since your safety is our primary concern.\n\n1. Serving high quality foodWhen people walk through the HEADQUART  , they are expecting to enjoy their meal and good Drinks. A good Dine does not compromise when it comes to serving great food. Setting high standards when it comes to the food quality is vital and it is important to ensure that our guest get the same quality every time. We have a highly experienced chef, who prepares meals using the best, high quality ingredients.\n\n2. The dining experienceApart from serving good food, customers look for a good overall experience when they visit in HEADQUART. We ensure that our guest  eats in a clean environment and gets the best service The servers need to be knowledgeable about the cuisine, something very helpful when you love exotic cuisine! Addressing issues promptly and making sure that the food and drinks get our guest in a timely manner is important.Essential features for restaurant appIn-app, online ordering , table reservation and mobile payments,It\'s make the lives of our guest easier, it also improves the efficiency and accuracy for handling orders.\n\n Kitchen managementThe prime purpose of this feature is to ensure proper coordination between the chefs and waiters. It avoids all the miscommunication between them; which ultimately results in increased production with less time consumed.Customer feedback portalfeedback system which allows your users to share their experiences as it helps you to know the customers’ demands which you would fill later to enhance user experience.\n\n',
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
