import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:shop_delivery/ui/screens/menu.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _qrInfo = 'Scan a QR/Bar code';
  bool _camState = false;
  Response response;
  Dio dio = new Dio();

  _qrCallback(String code) async {
    setState(() {
      _camState = false;
      _qrInfo = code;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan your Table"),
        backgroundColor: Color.fromRGBO(188, 158, 70, 1),
      ),
      body: _camState
          ? Center(
              child: SizedBox(
                height: 1000,
                width: 500,
                child: QRBarScannerCamera(
                  onError: (context, error) => Text(
                    error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) async {
                    await _qrCallback(code);
                    response = await dio.get(
                        "https://headquarter.maktechgroup.in/Mapi/table?id=" +
                            _qrInfo);
                    print(response.data.toString());
                    Map abcd = jsonDecode(response.data);
                    print(abcd);
                    if (abcd['data']['id'] != null)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Menu(
                                    id: abcd['data']['id'],
                                  )));
                    else
                      _scanCode();
                  },
                ),
              ),
            )
          : Center(
              child: Text(_qrInfo),
            ),
    );
  }
}
