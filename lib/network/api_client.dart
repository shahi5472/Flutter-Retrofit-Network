import 'package:dio/dio.dart';
import 'package:flutter_retrofit_network/data/post_model.dart';
import 'package:retrofit/http.dart';

import '../data/user_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: 'application/json',
    );
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET('users')
  Future<List<UserModel>> getUsers();

  @GET('posts')
  Future<List<PostModel>> getPosts();
}
