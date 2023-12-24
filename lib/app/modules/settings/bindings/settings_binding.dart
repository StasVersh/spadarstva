import 'package:get/get.dart';
import 'package:spadarstva/app/modules/settings/controllers/settings_controller.dart';

class SettingsBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<SettingsController>(
        () => SettingsController(Get.find()),
      ),
    ];
  }
}
