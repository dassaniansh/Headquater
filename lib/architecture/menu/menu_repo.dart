import 'dart:convert';
import 'package:shop_delivery/architecture/menu/menu_entity.dart';
import 'package:shop_delivery/base/BaseRepository.dart';
import 'package:shop_delivery/base/constants/ApiEndpoint.dart';
import 'package:shop_delivery/base/network/ApiHitter.dart';

class GetMenuRepo extends BaseRepository {
  Future<GetMenu> getMenu() async {
    ApiResponse apiResponse;

    apiResponse = await apiHitter.getApiResponse(
      ApiEndpoint.GETMENU,
    );

    if (apiResponse.status) {
      print(apiResponse.status);
      return GetMenu.fromJson(json.decode(apiResponse.response.data));
    } else {
      return GetMenu(status: false, message: apiResponse.msg);
    }
  }
}
