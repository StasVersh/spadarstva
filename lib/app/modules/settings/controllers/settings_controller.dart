import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spadarstva/app/data/models/user.dart';
import 'package:spadarstva/app/data/services/user_services.dart';
import 'package:spadarstva/app/global_widgets/app_getx_controller.dart';
import 'package:spadarstva/generated/locales.g.dart';

class SettingsController extends AppGetxController {
  final selectedLanguage = LocaleKeys.en.obs;
  final UserServices userServices;
  late Rx<User> user;

  SettingsController(this.userServices);

  @override
  void onInit() {
    user = userServices.currentUser!.obs;
    selectedLanguage.value = user.value.settings.language;
  }

  void setLanguage(String? language) async{
    selectedLanguage.value = language ?? LocaleKeys.en;
    showLoadingIndicator();
    await Get.updateLocale(Locale(selectedLanguage.value));
    user.value.settings.language = selectedLanguage.value;
    await userServices.updateUser(user.value);
    hideLoadingIndicator();
  }
}
