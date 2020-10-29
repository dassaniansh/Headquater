// import 'package:flutter/material.dart';
// import 'package:ondoorsuvidha/base/StreamConsumer.dart';

// Widget listStreamConsumer<T>(
//     AsyncSnapshot<List<T>> snapshot, Widget Function(int index) hasData) {
//   return streamConsumer(
//       snapshot,
//       () => ListView.builder(
//           itemCount: snapshot.data.length,
//           itemBuilder: (BuildContext context, int index) {
//             return hasData(index);
//           }));
// }
