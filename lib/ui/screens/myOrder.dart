import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_delivery/architecture/myOrder/myOrder_bloc.dart';
import 'package:shop_delivery/architecture/myOrder/myOrder_entity.dart';
import 'package:shop_delivery/architecture/user_create/user_create_entity.dart';

import '../../userRepo.dart';
import 'orderDetails.dart';

class MyOrderScreen extends StatefulWidget {
  // final String id;

  // const MyOrderScreen({Key key, this.id}) : super(key: key);

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  OrderBloc _myOrderBloc = OrderBloc();
  User user;
  int sum = 0;
  int errorVala = 1;
  List<Map<String, dynamic>> sendItemDetails = [];
  @override
  void initState() {
    getUser();
    // print(user.id.toString());
    _myOrderBloc.orders(id: 2);
    super.initState();
  }

  Future<void> getUser() async {
    user = await UserRepo().getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Color.fromRGBO(188, 158, 70, 1),
      ),
      body: StreamBuilder<MyOrder>(
          stream: _myOrderBloc.orderBloc.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.data.data.length == 0)
                return Center(child: Text('No Category found'));
              else {
                return view(snapshot.data);
              }
            } else
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: CircularProgressIndicator(),
                ),
              );
          }),
    );
  }

  view(MyOrder data) {
    // print(user.id);
    // print(arr);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.data.data.length,
      itemBuilder: (BuildContext context, int index) {
        Color primaryColor = Color.fromRGBO(188, 158, 70, 1);
        return Container(
          // height: 150,
          // width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {
              print(sendItemDetails);
              // print(arr[index]);
            },
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          // ignore: unrelated_type_equality_checks
                          color: data.data.data[index].orderStatus == '3'
                              ? Colors.green
                              : Colors.red,
                          shape: BoxShape.circle),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Sale no.  ' + data.data.data[index].saleNo),
                              Row(
                                children: [
                                  Icon(
                                    Icons.table_chart,
                                    color: Color.fromRGBO(188, 158, 70, 1),
                                  ),
                                  Text('  ' + data.data.data[index].saleNo),
                                ],
                              )
                            ],
                          ),
                          Text('Amount ${data.data.data[index].paidAmount}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // arr[index] -= 1;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  )),
                              GestureDetector(
                                onTap: () {
                                  print(data.data.data[index].id);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderDetail(
                                                id: data.data.data[index].id,
                                              )));
                                },
                                child: Container(
                                  color: primaryColor,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 3.0,
                                    horizontal: 12.0,
                                  ),
                                  child: Text(
                                    'View details',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // arr[index] = arr[index] + 1;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
