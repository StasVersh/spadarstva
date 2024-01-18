part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const SETTINGS = _Paths.SETTINGS;
  static const GROUP_SETTINGS = _Paths.GROUP_SETTINGS;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const SETTINGS = '/settings';
  static const GROUP_SETTINGS = '/group-settings';
}
