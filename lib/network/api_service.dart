import 'package:flutter_retrofit_network/data/network/api_response_model.dart';
import 'package:flutter_retrofit_network/network/exeption/error_handlers.dart';

import '../data/post_model.dart';
import '../data/user_model.dart';
import 'net_connect.dart';

class ApiService extends NetConnect {
  static ApiService get instance => ApiService();

  Future<ApiResponseModel> getUserList() async {
    return await apiClient.getUsers().then((value) {
      return ApiResponseModel<List<UserModel>>(error: false, data: value);
    }).onError((error, stackTrace) {
      return ApiResponseModel(
        error: true,
        message: ErrorHandlers.getException(error),
      );
    });
  }

  Future<ApiResponseModel> getPostList() async {
    return await apiClient.getPosts().then((value) {
      return ApiResponseModel<List<PostModel>>(error: false, data: value);
    }).onError((error, stackTrace) {
      return ApiResponseModel(
        error: true,
        message: ErrorHandlers.getException(error),
      );
    });
  }
}
