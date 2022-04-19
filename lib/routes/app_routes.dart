part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.home;
  static const post = _Paths.post;
}

abstract class _Paths {
  _Paths._();

  static const home = '/';
  static const post = '/post';
}
