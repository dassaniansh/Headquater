import 'dart:convert';

import 'package:shop_delivery/base/BaseRepository.dart';
import 'package:shop_delivery/base/constants/ApiEndpoint.dart';
import 'package:shop_delivery/base/network/ApiHitter.dart';

import 'myOrder_entity.dart';

class MyOrderRepo extends BaseRepository {
  Future<MyOrder> getMyOrder({id}) async {
    ApiResponse apiResponse;

    apiResponse = await apiHitter.getPostApiResponse(
      ApiEndpoint.MYORDER,
      data: {
        'id': id,
      },
    );

    if (apiResponse.status) {
      print(apiResponse.status);
      return MyOrder.fromJson(json.decode(apiResponse.response.data));
    } else {
      return MyOrder(status: false, message: apiResponse.msg);
    }
  }
}