import 'dart:convert';
import 'package:shop_delivery/architecture/user_create/user_create_entity.dart';
import 'package:shop_delivery/base/BaseRepository.dart';
import 'package:shop_delivery/base/constants/ApiEndpoint.dart';
import 'package:shop_delivery/base/network/ApiHitter.dart';

class OrderPlaceRepo extends BaseRepository {
  Future<User> placeOrder({data}) async {
    ApiResponse apiResponse;

    apiResponse = await apiHitter.getPostApiResponse(
      ApiEndpoint.PLACEORDER,
      data: {
        'order': data,
      },
    );

    if (apiResponse.status) {
      print(apiResponse.status);
      return apiResponse.response.data;
    } else {
      return User(status: false, message: apiResponse.msg);
    }
  }
}
