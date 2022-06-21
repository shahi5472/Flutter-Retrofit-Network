import 'package:flutter/material.dart';
import 'package:flutter_retrofit_network/data/items.dart';
import 'package:flutter_retrofit_network/data/network/api_response_model.dart';
import 'package:flutter_retrofit_network/network/exeption/error_handlers.dart';
import 'package:flutter_retrofit_network/network/local_connect.dart';
import 'package:flutter_retrofit_network/network/net_connect.dart';

import '../data/post_model.dart';
import '../data/user_model.dart';

class ApiService extends NetConnect {
  static ApiService get instance => ApiService();

  Future<ApiResponseModel> getUserList() async {
    return await client.getUsers().then((value) {
      debugPrint("Response for getUserList :: $value");
      return ApiResponseModel<List<UserModel>>(error: false, data: value);
    }).onError((error, stackTrace) {
      debugPrint("Error Response for getUserList :: $error");
      return ApiResponseModel(
        error: true,
        message: ErrorHandlers.getException(error),
      );
    });
  }

  Future<ApiResponseModel> getPostList() async {
    return await client.getPosts().then((value) {
      debugPrint("Response for getPostList :: $value");
      return ApiResponseModel<List<PostModel>>(error: false, data: value);
    }).onError((error, stackTrace) {
      debugPrint("Error Response for getPostList :: $error");
      return ApiResponseModel(
        error: true,
        message: ErrorHandlers.getException(error),
      );
    });
  }

  Future<ApiResponseModel> getCityList() async {
    return await client.getCity().then((value) {
      debugPrint("Response for getCityList :: $value");
      return ApiResponseModel<List<Items>>(
        error: false,
        data: value.data!.items,
      );
    }).onError((error, stackTrace) {
      debugPrint("Error Response for getCityList :: $error");
      return ApiResponseModel(
        error: true,
        message: ErrorHandlers.getException(error),
      );
    });
  }

  Future<ApiResponseModel> getCountryList() async {
    return await client.getCountry().then((value) {
      debugPrint("Response for getCountryList :: $value");
      return ApiResponseModel<List<Items>>(
        error: false,
        data: value.data!.items,
      );
    }).onError((error, stackTrace) {
      debugPrint("Error Response for getCountryList :: $error");
      return ApiResponseModel(
        error: true,
        message: ErrorHandlers.getException(error),
      );
    });
  }
}
