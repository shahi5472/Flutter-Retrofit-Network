import '../data/city_model.dart';
import '../data/country_model.dart';
import '../data/post_model.dart';
import '../data/user_model.dart';

abstract class NetworkMethod {
  Future<List<UserModel>> getUsers();

  Future<List<PostModel>> getPosts();

  Future<CityModel> getCity();

  Future<CountryModel> getCountry();
}
