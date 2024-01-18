import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:spadarstva/app/data/models/group.dart';
import 'package:spadarstva/app/data/models/notification.dart';
import 'package:spadarstva/app/data/models/notification_type.dart';
import 'package:spadarstva/app/data/models/user.dart';
import 'package:spadarstva/app/data/services/auth_services.dart';
import 'package:spadarstva/app/data/services/group_services.dart';
import 'package:spadarstva/app/data/services/notification_services.dart';
import 'package:spadarstva/app/data/services/user_services.dart';
import 'package:spadarstva/app/global_widgets/app_getx_controller.dart';
import 'package:spadarstva/app/modules/home/tabs/profile/views/add_member.dart';
import 'package:spadarstva/app/modules/home/tabs/profile/views/member_control.dart';
import 'package:spadarstva/app/routes/app_pages.dart';

class ProfileController extends AppGetxController {
  final AuthServices authServices;
  final UserServices userServices;
  final GroupServices groupServices;
  final NotificationServices notificationServices;
  final userFinding = false.obs;
  late Rx<User> user;
  Rx<Group>? group;
  Rx<User>? foundUser;
  var groupUsers = RxList<User>.empty(growable: false);

  ProfileController(
    this.authServices,
    this.userServices,
    this.groupServices,
    this.notificationServices,
  );

  @override
  void onInit() async {
    super.onInit();
    user = userServices.currentUser!.obs;
    if (user.value.group != null) {
      await updateGroup();
    }
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

  void goToSettings() {
    Get.toNamed(Routes.SETTINGS);
  }

  void addGroup() async {
    showLoadingIndicator();
    var groupRef =
        await groupServices.addGroup(Group(users: [user.value.uid!]));
    user.value.group = groupRef;
    await userServices.updateUser(user.value);
    await updateGroup();
    user.refresh();
    hideLoadingIndicator();
  }

  void addMember() {
    Get.bottomSheet(const AddMember(), curve: Curves.easeOut);
  }

  void memberControl(User selectedUser) {
    Get.bottomSheet(MemberControl(selectedUser), curve: Curves.easeOut);
  }

  Future updateGroup() async {
    group = (await groupServices.getGroup(user.value.group!.id)).obs;
    groupUsers.value = await userServices.getUsersFromGroup(group!.value);
    groupUsers.refresh();
  }

  void bunMember(User selectedUser) async {
    showLoadingIndicator();
    await groupServices.bunUserFromGroup(group!.value, selectedUser);
    if (selectedUser.uid!.id == user.value.uid!.id) {
      user.value.group = null;
      await userServices.updateUser(user.value);
      user.refresh();
    }
    groupUsers.remove(selectedUser);
    groupUsers.refresh();
    hideLoadingIndicator();
    Get.back();
    Get.back();
  }

  void findUser(String email) async {
    if (email.length > 4 && email.contains('@')) {
      userFinding.value = true;
      var newUser = await userServices.findFreeUserByEmail(email);
      if (newUser != null) {
        foundUser = newUser.obs;
      } else {
        foundUser = null;
      }
      foundUser?.refresh();
      userFinding.value = false;
    }
  }

  void inviteUser(User selectedUser) async {
    showLoadingIndicator();
    await notificationServices.addGroup(
      Notification(userTo: selectedUser.uid!, type: NotificationType.invite),
    );
    hideLoadingIndicator();
  }
}
