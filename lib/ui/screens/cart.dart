import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shop_delivery/architecture/menu/menu_entity.dart';
import 'package:shop_delivery/architecture/placeOrder/placeOrder_bloc.dart';
import 'package:shop_delivery/architecture/user_create/user_create_entity.dart';
import 'package:dio/dio.dart';
import '../../userRepo.dart';

class Cart extends StatefulWidget {
  final List<Data> cart;

  final String table_id;
  final List<Map<String, dynamic>> order_items;

  const Cart({Key key, this.cart, this.table_id, this.order_items})
      : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  User user;
  Razorpay _razorpay;
  Response response;
  Dio dio = new Dio();
  OrderPlace orderPlace = OrderPlace();
  int errorVala = 1;
  List<int> arr;
  int sum = 0;

  Future<void> getUser() async {
    user = await UserRepo().getUser();
    setState(() {});
  }

  itemListCount() {
    arr = List(widget.cart.length);
    for (int i = 0; i < widget.cart.length; i++) {
      arr[i] = 1;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getUser();
    itemListCount();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color.fromRGBO(188, 158, 70, 1),
      ),
      body: widget.cart.length == 0
          ? Center(
              child: Text(
                'No items in cart',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: widget.cart.length,
              itemBuilder: (BuildContext context, int index) {
                // Map<String, String> food = foods[index];
                Color primaryColor = Theme.of(context).primaryColor;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: GestureDetector(
                      onTap: () {},
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(widget.cart[index].name),
                                        // Icon(Icons.delete_outline)
                                      ],
                                    ),
                                    Text('${widget.cart[index].salePrice}'),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        GestureDetector(
                                            onTap: () {
                                              print(arr[index]);
                                              if (sum != 0 && arr[index] != 0) {
                                                setState(() {
                                                  arr[index] -= 1;
                                                  widget.order_items[index]
                                                          ['item_quantity'] =
                                                      arr[index];
                                                  print(widget.order_items[
                                                              index]
                                                          ['item_quantity'] =
                                                      arr[index]);

                                                  sum -= widget.cart[index]
                                                          .salePrice *
                                                      arr[index];
                                                });
                                              } else if (arr[index] == 0) {
                                                setState(() {
                                                  widget.cart.remove(index);
                                                });
                                              }
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.remove,
                                                color: Color.fromRGBO(
                                                    188, 158, 70, 1),
                                              ),
                                            )),
                                        Container(
                                          color:
                                              Color.fromRGBO(188, 158, 70, 1),
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 3.0,
                                            horizontal: 12.0,
                                          ),
                                          child: Text(
                                            '${arr[index]}',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              arr[index] = arr[index] + 1;
                                              widget.order_items[index]
                                                      ['item_quantity'] =
                                                  arr[index];
                                              print(widget.order_items[index]
                                                      ['item_quantity'] =
                                                  arr[index]);
                                              sum +=
                                                  widget.cart[index].salePrice *
                                                      arr[index];
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.add,
                                              color: Color.fromRGBO(
                                                  188, 158, 70, 1),
                                            ),
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
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        backgroundColor: Color.fromRGBO(188, 158, 70, 1),
        onPressed: () {
          // openCheckout();
          if (user != null) {
            print(user);
            sendMap();
          } else
            Fluttertoast.showToast(
                msg: "Please login",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Color.fromRGBO(188, 158, 70, 1),
                textColor: Colors.white,
                fontSize: 16.0);
        },
      ),
    );
  }

  sendMap() async {
    Map<String, dynamic> map = {
      'customer_id': errorVala,
      'waiter_id': errorVala + 3,
      'total_items_in_cart': widget.cart.length,
      'sub_total': sum,
      'total_vat': errorVala,
      'total_payable': sum,
      'total_item_discount_amount': errorVala,
      'delivery_charge': errorVala - 1,
      'sub total_discount_value': errorVala,
      'sub_total_discount_type': errorVala,
      'order_type': errorVala,
      'order_status': errorVala,
      'sale_vat_objects': errorVala,
      'order_table': {
        'table_id': widget.table_id,
        'persons': errorVala,
      },
      'items': widget.order_items,
    };

    print(map);

    print(widget.order_items[0]['item_quantity']);

    print(json.encode(map));

    String url = "https://headquarter.maktechgroup.in/Mapi/add_sale_by_ajax";

    var response = await http.post(url, body: {'order': json.encode(map)});
    print(response.body);
    print(response);

    if (response.statusCode == 200) openCheckout();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_DDzhylzU0IjQIh',
      'amount': 100 * sum,
      'name': user.name,
      'prefill': {'contact': user.phone, 'email': user.email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    AwesomeDialog(
        context: context,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        title: 'Success',
        desc: 'Thanks For your Payment' + response.paymentId,
        btnOkOnPress: () {
          // register(true);
          sendMap();
        },
        btnOkIcon: Icons.check_circle,
        onDissmissCallback: () {
          debugPrint('Dialog Dissmiss from callback');
        })
      ..show();

    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: false,
        title: 'Error',
        desc: response.message + ' Error Please Try Again',
        btnOkOnPress: () {
          Navigator.of(context).pop();
        },
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red)
      ..show();

    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
  }
}
