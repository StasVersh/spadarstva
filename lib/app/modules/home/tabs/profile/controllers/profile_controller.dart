import 'package:get/get.dart';
import 'package:spadarstva/app/data/models/user.dart';
import 'package:spadarstva/app/data/services/auth_services.dart';
import 'package:spadarstva/app/data/services/user_services.dart';
import 'package:spadarstva/app/global_widgets/app_getx_controller.dart';
import 'package:spadarstva/app/routes/app_pages.dart';

class ProfileController extends AppGetxController {
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
    showLoadingIndicator();
    await authServices.logout();
    hideLoadingIndicator();
    Get.offNamed(Routes.LOGIN);
  }

  void deleteProfile() async {
    showLoadingIndicator();
    await userServices.deleteUser(userServices.currentUser!.uid!.id);
    await authServices.delete();
    hideLoadingIndicator();
    Get.offNamed(Routes.LOGIN);
  }

  void goToSettings(){
    Get.toNamed(Routes.SETTINGS);
  }
}
