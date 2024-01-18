import 'package:get/get.dart';
import 'package:spadarstva/app/modules/home/controllers/home_controller.dart';
import 'package:spadarstva/app/modules/home/tabs/main/controllers/main_controller.dart';
import 'package:spadarstva/app/modules/home/tabs/profile/controllers/profile_controller.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<HomeController>(
        () => HomeController(),
      ),
      Bind.lazyPut<MainController>(
        () => MainController(),
      ),
      Bind.lazyPut<ProfileController>(
        () => ProfileController(
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
        ),
      ),
    ];
  }
}
