import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spadarstva/app/global_widgets/app_alert.dart';
import 'package:spadarstva/app/global_widgets/app_tile.dart';
import 'package:spadarstva/app/global_widgets/loading.dart';
import 'package:spadarstva/app/global_widgets/page_title.dart';
import 'package:spadarstva/app/modules/home/tabs/profile/controllers/profile_controller.dart';
import 'package:spadarstva/core/theme/app_colors.dart';
import 'package:spadarstva/core/theme/app_text_styles.dart';
import 'package:spadarstva/generated/locales.g.dart';

class AddMember extends GetView<ProfileController> {
  const AddMember({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.userFinding.value = false;
        controller.foundUser = null;
        return true;
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PageTitle(title: 'Add member'),
              Row(
                children: [
                  const Icon(Icons.search, size: 24),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      cursorColor: AppColors.text,
                      decoration: InputDecoration(
                        hintText: 'Enter user email',
                        hintStyle: AppTextStyles.regular,
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: controller.findUser,
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 8),
              Obx(
                () => controller.userFinding.value
                    ? const Center(
                        child: Loading(size: 50),
                      )
                    : Column(
                        children: [
                          if (controller.foundUser == null)
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: Text(
                                  'No results',
                                  style: AppTextStyles.regular,
                                ),
                              ),
                            ),
                          if (controller.foundUser != null)
                            AppTile(
                              avatar: Image.network(
                                controller.foundUser!.value.photoUrl!,
                              ),
                              label: controller.foundUser!.value.name!,
                              onTap: () {
                                Get.dialog(
                                  AppAlert(
                                    text: LocaleKeys.toInvite.tr,
                                    description:
                                        LocaleKeys.toInviteDescription.tr,
                                    submitText: LocaleKeys.toInvite.tr,
                                    discardText: LocaleKeys.cancel.tr,
                                    onDiscard: Get.back,
                                    onSubmit: () {
                                      Get.back();
                                      Get.back();
                                      controller.inviteUser(
                                          controller.foundUser!.value);
                                    },
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
