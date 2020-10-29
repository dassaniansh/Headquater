import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_delivery/architecture/user_create/user_create_entity.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shop_delivery/ui/screens/menu.dart';
import '../../userRepo.dart';
import 'login.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => new _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  User user;
  TextEditingController mob = TextEditingController();
  GoogleSignIn googleAuth = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController otpbatao = TextEditingController();

  Future<void> getUser() async {
    user = await UserRepo().getUser();
    setState(() {});
  }

  signInwithGoogle() async {
    try {
      await googleAuth.signIn();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      print(e);
    }
  }

  Future<bool> phoneAuth(String phone, BuildContext context) {
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          AuthResult result = await _auth.signInWithCredential(credential);
          Navigator.of(context).pop();
          FirebaseUser user = result.user;
          if (user != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LoginScreen(email: '', phone: mob.text.trim())));
          }
        },
        verificationFailed: (AuthException exception) {
          print(exception.toString());
        },
        codeSent: (String verificationid, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Verification Code"),
                  content: Column(
                    children: <Widget>[
                      TextField(
                        controller: otpbatao,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () async {
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationid,
                                smsCode: otpbatao.text.trim());

                        AuthResult result =
                            await _auth.signInWithCredential(credential);
                        FirebaseUser user = result.user;
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                        email: googleAuth.currentUser.email
                                            .toString(),
                                        phone: '',
                                      )));
                        }
                      },
                      child: Text('Confirm'),
                      textColor: Colors.white,
                      color: Colors.blue,
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }

  @override
  void initState() {
    // TODO: implement initState
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.black.withOpacity(0.8)),
          clipper: getClipper(),
        ),
        Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(188, 158, 70, 1),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 90.0),
                Text(
                  user == null ? 'Guest' : user.name,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Text(
                  user == null ? 'No email address' : user.email,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Text(
                  user == null ? 'Phone Number' : user.phone,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Text(
                  user == null ? 'Your Date of birth' : user.dateOfBirth,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                // Text(
                //   'Subscribe guys',
                //   style: TextStyle(
                //       fontSize: 17.0,
                //       fontStyle: FontStyle.italic,
                //       fontFamily: 'Montserrat'),
                // ),
                SizedBox(height: 25.0),
                // Container(
                //     height: 30.0,
                //     width: 95.0,
                //     child: Material(
                //       borderRadius: BorderRadius.circular(20.0),
                //       shadowColor: Colors.greenAccent,
                //       color: Colors.green,
                //       elevation: 7.0,
                //       child: GestureDetector(
                //         onTap: () {},
                //         child: Center(
                //           child: Text(
                //             'Edit Name',
                //             style: TextStyle(
                //                 color: Colors.white, fontFamily: 'Montserrat'),
                //           ),
                //         ),
                //       ),
                //     )),
                SizedBox(height: 25.0),
                user == null
                    ? Column(
                        children: [
                          Container(
                              height: 40.0,
                              width: 120.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.redAccent,
                                color: Color.fromRGBO(188, 158, 70, 1),
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {
                                    signInwithGoogle();
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => Menu()));
                                  },
                                  child: Center(
                                    child: Text(
                                      'Log in with Google',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                              height: 40.0,
                              width: 120.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.redAccent,
                                color: Color.fromRGBO(188, 158, 70, 1),
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {
                                    phoneForm();
                                  },
                                  child: Center(
                                    child: Text(
                                      'Log in with Phone',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      )
                    : Container(
                        height: 40.0,
                        width: 120.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.redAccent,
                          color: Color.fromRGBO(188, 158, 70, 1),
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () async{
                              await _auth.signOut();
                              print(_auth.currentUser());
                            },
                            child: Center(
                              child: Text(
                                'Log out',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
              ],
            ))
      ],
    ));
  }

  phoneForm() {
    return Alert(
        context: context,
        title: "PHONE LOGIN",
        content: Column(
          children: <Widget>[
            TextField(
              controller: mob,
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Phone number',
              ),
            ),
            // TextField(
            //   obscureText: true,
            //   decoration: InputDecoration(
            //     icon: Icon(Icons.lock),
            //     labelText: 'Password',
            //   ),
            // ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              String phone = '+91' + mob.text.trim();
              phoneAuth(phone, context);
              Navigator.pop(context);
            },
            child: Text(
              "Send OTP",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
