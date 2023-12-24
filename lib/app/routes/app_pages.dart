import 'package:get/get.dart';
import 'package:spadarstva/app/modules/home/bindings/home_binding.dart';
import 'package:spadarstva/app/modules/home/views/home_view.dart';
import 'package:spadarstva/app/modules/login/bindings/login_binding.dart';
import 'package:spadarstva/app/modules/login/views/login_view.dart';
import 'package:spadarstva/app/modules/settings/bindings/settings_binding.dart';
import 'package:spadarstva/app/modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      bindings: [SettingsBinding()],
    ),
  ];
}
