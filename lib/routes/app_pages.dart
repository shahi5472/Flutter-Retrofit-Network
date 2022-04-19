import 'package:flutter_retrofit_network/home/binding/home_binding.dart';
import 'package:flutter_retrofit_network/home/view/home_view.dart';
import 'package:flutter_retrofit_network/post/binding/post_binding.dart';
import 'package:flutter_retrofit_network/post/view/post_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.post,
      page: () => const PostView(),
      binding: PostBinding(),
    ),
  ];
}
