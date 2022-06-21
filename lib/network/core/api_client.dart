import 'package:dio/dio.dart';
import 'package:flutter_retrofit_network/data/post_model.dart';
import 'package:flutter_retrofit_network/network/network_method.dart';

import 'package:retrofit/http.dart';

import '../../data/user_model.dart';

import 'package:flutter_retrofit_network/data/city_model.dart';
import 'package:flutter_retrofit_network/data/country_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiClient implements NetworkMethod {
  factory ApiClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: const Duration(seconds: 20).inMilliseconds,
      connectTimeout: const Duration(seconds: 20).inMilliseconds,
      contentType: 'application/json',
    );
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @override
  @GET('users')
  Future<List<UserModel>> getUsers();

  @override
  @GET('posts')
  Future<List<PostModel>> getPosts();

  @override
  @GET('city')
  Future<CityModel> getCity();

  @override
  @GET('country')
  Future<CountryModel> getCountry();
}
