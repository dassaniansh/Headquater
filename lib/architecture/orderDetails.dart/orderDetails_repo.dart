import 'dart:convert';

import 'package:shop_delivery/architecture/orderDetails.dart/orderDetails_entity.dart';
import 'package:shop_delivery/base/BaseRepository.dart';
import 'package:shop_delivery/base/constants/ApiEndpoint.dart';
import 'package:shop_delivery/base/network/ApiHitter.dart';

class OrderDetailRepo extends BaseRepository {
  Future<OrderDetails> getMyOrder({id}) async {
    ApiResponse apiResponse;

    apiResponse = await apiHitter.getPostApiResponse(
      ApiEndpoint.ORDERDETAIL,
      data: {
        'id': id,
      },
    );

    if (apiResponse.status) {
      print(apiResponse.status);
      return OrderDetails.fromJson(json.decode(apiResponse.response.data));
    } else {
      return OrderDetails(status: false, message: apiResponse.msg);
    }
  }
}
