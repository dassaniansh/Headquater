import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_delivery/architecture/menu/menu_bloc.dart';
import 'package:shop_delivery/architecture/menu/menu_entity.dart';
import 'package:shop_delivery/architecture/placeOrder/placeOrder_bloc.dart';
import 'package:shop_delivery/ui/screens/cart.dart';

class Menu extends StatefulWidget {
  final String id;

  const Menu({Key key, this.id}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  GetMenuBloc _getMenuBloc = GetMenuBloc();
  List<Data> cart = [];
  int sum = 0;
  int errorVala = 1;
  // List<int> arr;
  List item_vat;
  int list_count;
  List<Map<String, dynamic>> sendItemDetails = [];
  @override
  void initState() {
    // TODO: implement initState
    // callFuture();
    super.initState();
  }

  Future<void> callFuture() async {
    await getitemCount();
  }

  Future<void> getitemCount() async {
    Response response;
    Dio dio = new Dio();
    response =
        await dio.get("https://headquarter.maktechgroup.in/Mapi/getmenu?id=1");
    Map abcd = jsonDecode(response.data);
    List array_t = abcd['data'];
    print(array_t.length);
    list_count = array_t.length;
    // arr = List(list_count);
    // for (int i = 0; i < list_count; i++) {
    //   arr[i] = 1;
    // }
  }

  @override
  Widget build(BuildContext context) {
    _getMenuBloc.getMenu();
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Color.fromRGBO(188, 158, 70, 1),
      ),
      body: StreamBuilder<GetMenu>(
          stream: _getMenuBloc.getMenuBloc.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.data.length == 0)
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(188, 158, 70, 1),
        child: Icon(Icons.add_shopping_cart),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Cart(
                        order_items: sendItemDetails,
                        table_id: widget.id,
                        cart: cart,
                      )));
        },
      ),
    );
  }

  view(GetMenu data) {
    // print(arr);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.data.length,
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
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(''),
                      ),
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
                              Text(data.data[index].name),
                              Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              )
                            ],
                          ),
                          Text('${data.data[index].salePrice}'),
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
                                  setState(() {
                                    cart.add(data.data[index]);
                                    // sum +=
                                    //     data.data[index].salePrice * arr[index];
                                    print(sendItemDetails);
                                    sendItemDetails.add({
                                      'item_id': data.data[index].id,
                                      'item_name': data.data[index].name,
                                      'item_vat': item_vat,
                                      'item_discount': errorVala - 1,
                                      'discount_type': 'plain',
                                      'item_price_without_discount':
                                          data.data[index].salePrice,
                                      'item_unit_price':
                                          data.data[index].salePrice,
                                      'item_quantity': errorVala,
                                      'item_previous_id': '',
                                      'item_type': 1,
                                      'item_cooking_done_item': '',
                                      'item_cooking_start_time': '',
                                      'item_cooking_status': errorVala,
                                      'item_price_with_discount':
                                          data.data[index].salePrice,
                                      'item_discount_amount': errorVala - 1,
                                      'modifiers_id': errorVala,
                                      'modifiers_price': errorVala,
                                      'item_note': errorVala,
                                    });
                                  });
                                  Fluttertoast.showToast(
                                      msg: "Item added to cart Successfully",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Color.fromRGBO(188, 158, 70, 1),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  print(sendItemDetails);
                                  // print(arr[index]);
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
                                    'Add to cart',
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
