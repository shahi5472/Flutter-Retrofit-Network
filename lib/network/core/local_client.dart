import 'package:flutter/services.dart';
import 'package:flutter_retrofit_network/data/city_model.dart';
import 'package:flutter_retrofit_network/data/country_model.dart';
import 'package:flutter_retrofit_network/data/post_model.dart';
import 'package:flutter_retrofit_network/data/user_model.dart';
import 'package:flutter_retrofit_network/network/network_method.dart';
import 'package:get/get.dart';

class LocalClient implements NetworkMethod {
  LocalClient._();

  static LocalClient get instance => LocalClient._();

  Future<String> _getResponse({required String endPoint}) async {
    await 2.delay();
    return await rootBundle.loadString('assets/mock_json/$endPoint.json');
  }

  @override
  Future<CityModel> getCity() async {
    return cityModelFromJson(
      await _getResponse(endPoint: 'all_cities_list_get_response'),
    );
  }

  @override
  Future<CountryModel> getCountry() async {
    return countryModelFromJson(
      await _getResponse(endPoint: 'all_countries_list_get_response'),
    );
  }

  @override
  Future<List<PostModel>> getPosts() async {
    return [];
  }

  @override
  Future<List<UserModel>> getUsers() async {
    return [];
  }
}
