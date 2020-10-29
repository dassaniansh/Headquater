import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

// import 'package:shop_delivery/global.dart';
// import 'package:shop_delivery/ui/widgets/counter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;

dynamicFormData obj = dynamicFormData();

class Myform extends StatefulWidget {
  @override
  _MyformState createState() => _MyformState();
}

class _MyformState extends State<Myform> {
  int _radioValue1 = -1;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;

  Dio dio = Dio();

  // static const platform = const MethodChannel(
  //     "razorpay_flutter");

  final fullName = TextEditingController();
  final nickName = TextEditingController();
  final mobile = TextEditingController();
  final address = TextEditingController();
  final profession = TextEditingController();
  final aadharNo = TextEditingController();
  final email = TextEditingController();
  final dateOfBirth = TextEditingController();
  final dateOfAnniversary = TextEditingController();

  List<Map<String, dynamic>> abcd = [
    {'Ansh': 'Dassani'}
  ];

  Razorpay _razorpay;
  bool monVal = false;

  File image;
  File image1;

  // DateTime adob;

  List<DynamicForm> dynamicform = [];

  addDynamic() {
    dynamicform.add(DynamicForm());
    setState(() {});
  }

  deleteDynamic(int i) {
    dynamicform.removeAt(i);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;
    });
  }

  void _handleRadioValueChange4(int value) {
    setState(() {
      _radioValue4 = value;
    });
  }

  sendForm() async {
    dynamic res = abcd.removeAt(0);
    print(res);

    Map<String, dynamic> data = {
      'userimg': image,
      'fname': fullName.text,
      'nickname': nickName.text,
      'gender': _radioValue3,
      'mob': mobile.text,
      'dob': dateOfBirth.text,
      'mstatus': _radioValue1,
      'dobm': dateOfAnniversary.text,
      'madd': address.text,
      'memail': email.text,
      'mprofession': profession.text,
      'madhaar': aadharNo.text,
      'member_type': _radioValue2,
      'plan': _radioValue4,
      'memdetails': abcd,
    };

    print(dynamicform);

    print(data);

    // print(json.encode(data));

    FormData formData = new FormData.fromMap(data);
    var response = await dio.post("https://192.168.137.110/pos/mapi/member",
        data: formData);

    // var url = 'https://192.2.8/pos/mapi/member';
    // var response = await http.post(url, body: data);
    print('Response status: ${response.statusCode}');
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 200,
      maxWidth: 400,
    );

    setState(() {
      image = image;
    });
  }

  Future getImage1() async {
    var image1 = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 200,
      maxWidth: 400,
    );

    setState(() {
      image1 = image1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(188, 158, 70, 1),
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back)),
        title: Text(
          'Membership Form',
          style: TextStyle(fontSize: 16.0),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.add_alert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 25.0),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Center(
                    child: image == null
                        ? Text('No image selected.')
                        : Image.file(
                            image,
                            width: 50,
                            height: 50,
                          ),
                  ),
                ),
                Center(
                  child: OutlineButton(
                    onPressed: getImage,
                    child: Text('Choose Image'),
                  ),
                ),
                SizedBox(height: 25.0),
                TextField(
                  obscureText: false,
                  controller: fullName,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(height: 25.0),
                TextField(
                  obscureText: false,
                  controller: nickName,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Nick Name (Optional)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(height: 25.0),
                new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        'Gender',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(
                            value: 0,
                            groupValue: _radioValue3,
                            onChanged: _handleRadioValueChange3,
                          ),
                          new Text(
                            'Male',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          new Radio(
                            value: 1,
                            groupValue: _radioValue3,
                            onChanged: _handleRadioValueChange3,
                          ),
                          new Text(
                            'Female',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          new Radio(
                            value: 2,
                            groupValue: _radioValue3,
                            onChanged: _handleRadioValueChange3,
                          ),
                          new Text(
                            'Other',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ]),
                SizedBox(height: 25.0),
                TextField(
                  obscureText: false,
                  controller: mobile,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Mobile No.",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: dateOfBirth,
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Date of Birth",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(
                  height: 15.0,
                ),
                new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(
                            value: 0,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          new Text(
                            'Married',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          new Radio(
                            value: 1,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          new Text(
                            'UnMarried',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          new Radio(
                            value: 3,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          new Text(
                            'Other',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ]),
                SizedBox(height: 25.0),
                _radioValue1 == 0
                    ? TextField(
                        obscureText: false,
                        controller: dateOfAnniversary,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Date of Marriage",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      )
                    : Container(),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  obscureText: false,
                  keyboardType: TextInputType.multiline,
                  controller: address,
                  minLines: 1,
                  //Normal textInputField will be displayed
                  maxLines: 5,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  obscureText: false,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  //Normal textInputField will be displayed
                  maxLines: 5,
                  controller: email,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  obscureText: false,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  //Normal textInputField will be displayed
                  maxLines: 5,
                  controller: profession,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Profession",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  obscureText: false,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  //Normal textInputField will be displayed
                  maxLines: 5,
                  controller: aadharNo,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Adhaar No.",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(
                  height: 15.0,
                ),
                new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        'Type of Membership',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(
                            value: 0,
                            groupValue: _radioValue2,
                            onChanged: _handleRadioValueChange2,
                          ),
                          new Text(
                            'Single',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          // new Radio(
                          //   value: 1,
                          //   groupValue: _radioValue2,
                          //   onChanged: _handleRadioValueChange2,
                          // ),
                          // new Text(
                          //   'Couple',
                          //   style: new TextStyle(
                          //     fontSize: 16.0,
                          //   ),
                          // ),
                          new Radio(
                            value: 1,
                            groupValue: _radioValue2,
                            onChanged: _handleRadioValueChange2,
                          ),
                          new Text(
                            'Family',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ]),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: dynamicform.length,
                      itemBuilder: (context, index) {
                        print(dynamicFormData);
                        return Column(
                          children: <Widget>[
                            DynamicForm(),
                            GestureDetector(
                              onTap: () {
                                print('object');
                                deleteDynamic(index);
                              },
                              child: Icon(
                                Icons.delete,
                                size: 40,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                SizedBox(height: 25.0),
                new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        'Choose Your Plan',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Radio(
                            value: 400000,
                            groupValue: _radioValue4,
                            onChanged: _handleRadioValueChange4,
                          ),
                          new Text(
                            'Single 4000/-',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          new Radio(
                            value: 700000,
                            groupValue: _radioValue4,
                            onChanged: _handleRadioValueChange4,
                          ),
                          new Text(
                            'Couple 7000/-',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          new Radio(
                            value: 1000000,
                            groupValue: _radioValue4,
                            onChanged: _handleRadioValueChange4,
                          ),
                          new Text(
                            'Family 10000/-',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ]),
                SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: monVal,
                      onChanged: (bool value) {
                        setState(() {
                          monVal = value;
                        });
                      },
                    ),
                    Text("I Agree to the Terms and Conditions"),
                  ],
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color.fromRGBO(188, 158, 70, 1),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      // openCheckout();
                      sendForm();
                    },
                    child: Text("Confirm Your Booking Amount",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          addDynamic();
          if (obj.name != null)
            abcd.add({
              'name': obj.name,
              'dob': obj.dob,
              'relation': obj.relation,
              'img': await MultipartFile.fromFile(obj.image.path,
                  filename: path.basename(obj.image.path))
            });
          print(abcd);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_q813ylCfadWH0T',
      'amount': _radioValue4,
      'name': "uername",
      'prefill': {'contact': "888888", 'email': "rozerpay"},
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
        title: 'Succes',
        desc: 'Thanks For your Payment' + response.paymentId,
        btnOkOnPress: () {
          Navigator.of(context).pop();
        },
        btnOkIcon: Icons.check_circle,
        onDissmissCallback: () {
          debugPrint('Dialog Dissmiss from callback');
        })
      ..show();
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
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  Myform form = Myform();
}

class DynamicForm extends StatefulWidget {
  @override
  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  Myform form;

  File image;

  // dynamicFormData obj = dynamicFormData();

  List<Map<String, dynamic>> abcd;

  File image1;

  final name = TextEditingController();
  final relation = TextEditingController();
  final dob = TextEditingController();

  Future getImage1() async {
    var image1 = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 200,
      maxWidth: 400,
    );

    setState(() {
      image = image1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextField(
            obscureText: false,
            controller: name,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
          SizedBox(height: 25.0),
          TextField(
            obscureText: false,
            controller: dob,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Date of Birth",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
          SizedBox(height: 25.0),
          TextField(
            obscureText: false,
            controller: relation,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Relation with Applicant",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                image == null
                    ? Text('No image selected.')
                    : Image.file(
                        image,
                        width: 50,
                        height: 50,
                      ),
                SizedBox(
                  width: 50,
                ),
                IconButton(
                    icon: Icon(
                      Icons.done,
                      size: 40,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // dynamicFormData(
                      //     name: name.text,
                      //     relation: relation.text,
                      //     dob: dob.text);
                      obj.name = name.text;
                      obj.dob = dob.text;
                      obj.relation = relation.text;
                      obj.image = image;
                      print(obj.name);
                      print(obj.image);
                      print(obj);
                      // if (dynamicFormData != null) {
                      //   abcd.add({
                      //     'name': obj.name,
                      //     'dob': obj.dob,
                      //     'relation': obj.relation,
                      //   });
                      //   print(abcd);
                      // }
                    })
              ],
            ),
          ),
          Center(
            child: OutlineButton(
              onPressed: getImage1,
              child: Text('Choose Image'),
            ),
          ),
        ],
      ),
    );
  }
}

class dynamicFormData {
  String name;
  String dob;
  String relation;
  File image;

// dynamicFormData({this.name, this.dob, this.relation});
}
