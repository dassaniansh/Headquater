import 'dart:convert';
import 'package:shop_delivery/architecture/user_create/user_create_entity.dart';
import 'package:shop_delivery/base/BaseRepository.dart';
import 'package:shop_delivery/base/constants/ApiEndpoint.dart';
import 'package:shop_delivery/base/network/ApiHitter.dart';

class LoginRepo extends BaseRepository {
  Future<User> login({name,address,dob,email, phone}) async {
    ApiResponse apiResponse;

    apiResponse = await apiHitter.getPostApiResponse(
      ApiEndpoint.USER,
      data: {
        'name': name,
        'phone': phone,
        'email': email,
        'address': address,
        'date_of_birth': dob,
      },
    );

    if (apiResponse.status) {
      print(apiResponse.status);
      return User.fromJson(json.decode(apiResponse.response.data));
    } else {
      return User(status: false, message: apiResponse.msg);
    }
  }
}