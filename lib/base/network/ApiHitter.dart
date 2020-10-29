import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:shop_delivery/base/constants/ApiEndpoint.dart';

class ApiHitter {
  static Dio _dio;

  static Dio getDio() {
    if (_dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: ApiEndpoint.BASE_URL,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
      final now = new DateTime.now();
      final formatter = new DateFormat('yyyy-MM-dd H:m:s');
      return new Dio(options)
        ..interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
          //options.data["utc_current_date"] = now.toUtc().toString();
          // options.data["current_date"] = formatter.format(now);
          return options;
        }, onResponse: (Response response) {
          //   print(response.data.toString());
          //print(response);
          return response; // continue
        }, onError: (DioError e) {
          return e;
        }));
    } else {
      return _dio;
    }
  }

  Future<ApiResponse> getApiResponse(String endPoint,
      {Map<String, dynamic> headers,
      Map<String, dynamic> queryParameters, Map data}) async {
    try {
      Response response = await getDio().get(endPoint,
          options: Options(headers: headers), queryParameters: queryParameters);
      return ApiResponse(true, response: response);
    } catch (error) {
      try {
        return ApiResponse(false,
            msg:
                "${error.response.data['message'] ?? "Sorry Something went wrong."}");
      } catch (e) {
        return ApiResponse(false, msg: "Sorry Something went wrong.");
      }
    }
  }

  Future<ApiResponse> getApiDelete(String endPoint,
      {Map<String, dynamic> headers,
      Map<String, dynamic> queryParameters}) async {
    try {
      Response response = await getDio().delete(endPoint,
          options: Options(headers: headers), queryParameters: queryParameters);
      return ApiResponse(true, response: response);
    } catch (error) {
      try {
        return ApiResponse(false,
            msg:
                "${error.response.data['message'] ?? "Sorry Something went wrong."}");
      } catch (e) {
        return ApiResponse(false, msg: "Sorry Something went wrong.");
      }
    }
  }

  Future<ApiResponse> getPostApiResponse(String endPoint,
      {Map<String, dynamic> headers, Map<String, dynamic> data}) async {
    try {
      var response = await getDio().post(endPoint,
          options: Options(
            headers: headers,
            contentType: "application/x-www-form-urlencoded",
          ), data: data);
      return ApiResponse(true,
          response: response, msg: json.decode(response.data)["message"]);
    } catch (error) {
      try {
        return ApiResponse(false,
            msg:
                "${error.response.data['message'] ?? "Sorry Something went wrong."}");
      } catch (e) {
        return ApiResponse(false, msg: "Sorry Something went wrong.");
      }
    }
  }

  Future<ApiResponse> getPutApiResponse(String endPoint,
      {Map<String, dynamic> headers, Map<String, dynamic> data}) async {
    try {
      var response = await getDio().post(endPoint,
          options: Options(
            headers: headers,
            contentType: "application/x-www-form-urlencoded",
          ),
          data: data);
      return ApiResponse(true,
          response: response, msg: response.data["message"]);
    } catch (error) {
      try {
        return ApiResponse(false,
            msg:
                "${error?.response.data['message'] ?? "Sorry Something went wrong."}");
      } catch (e) {
        return ApiResponse(false, msg: "Sorry Something went wrong.");
      }
    }
  }

  Future<ApiResponse> getFormApiResponse(String endPoint,
      {FormData data, Map<String, dynamic> headers}) async {
    try {
      var response = await getDio().post(endPoint,
          data: data,
          options: Options(
            headers: headers,
          ));
      return ApiResponse(true,
          response: response, msg: response.data["message"]);
    } catch (error) {
      try {
        return ApiResponse(false,
            msg:
                "${error?.response['message'] ?? "Sorry Something went wrong."}");
      } catch (e) {
        return ApiResponse(false, msg: "Sorry Something went wrong.");
      }
    }
  }
}

class ApiResponse {
  final bool status;
  final dynamic msg;
  final Response response;

  ApiResponse(this.status, {this.msg = "Success", this.response});
}
