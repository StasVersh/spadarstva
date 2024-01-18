import 'package:get/get.dart';
import 'package:spadarstva/app/modules/group_settings/controllers/group_settings_controller.dart';

class GroupSettingsBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<GroupSettingsController>(
        () => GroupSettingsController(Get.find()),
      ),
    ];
  }
}
