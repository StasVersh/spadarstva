import 'dart:ffi';

import 'package:get/get.dart';
import 'package:spadarstva/app/data/models/user.dart';
import 'package:spadarstva/app/data/services/auth_services.dart';
import 'package:spadarstva/app/data/services/user_services.dart';
import 'package:spadarstva/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final AuthServices authServices;
  final UserServices userServices;
  late Rx<User> user;

  ProfileController(this.authServices, this.userServices);

  @override
  void onInit() {
    super.onInit();
    user = userServices.currentUser!.obs;
  }

  void logout() async {
    await authServices.logout();
    Get.offNamed(Routes.LOGIN);
  }
}
