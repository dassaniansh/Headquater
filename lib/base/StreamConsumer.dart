import 'package:flutter/material.dart';

Widget streamConsumer<T>(AsyncSnapshot<T> snapshot, Widget Function() hasData) {
  if (snapshot.hasData) {
    return hasData();
  } else if (snapshot.hasError) {
    return Center(child: Text("Sorry Something Went Wrong"));
  } else {
    return Center(child: CircularProgressIndicator());
  }
}
