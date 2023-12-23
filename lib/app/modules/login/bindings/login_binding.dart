import 'package:get/get.dart';
import 'package:spadarstva/app/modules/login/controllers/login_controller.dart';

class LoginBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<LoginController>(
        () => LoginController(Get.find()),
      ),
    ];
  }
}
