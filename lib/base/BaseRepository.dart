import 'dart:io';
import 'package:shop_delivery/base/network/ApiHitter.dart';
import 'package:intl/intl.dart';

class BaseRepository {
  final apiHitter = ApiHitter();
  final dio = ApiHitter.getDio();

  getCurrentTimeString() {
    final now = new DateTime.now();
    final formatter = new DateFormat('yyyy-MM-dd H:m:s');
    return formatter.format(now);
  }

  String getUtcTime() {
    return DateTime.now().toUtc().toString();
  }

  String getdevice() {
    if (Platform.isIOS)
      return "ios";
    else
      return "android";
  }
}
