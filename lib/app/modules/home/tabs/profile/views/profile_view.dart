import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spadarstva/app/global_widgets/app_tile.dart';
import 'package:spadarstva/app/global_widgets/default_view.dart';
import 'package:spadarstva/app/global_widgets/page_title.dart';
import 'package:spadarstva/app/modules/home/tabs/profile/controllers/profile_controller.dart';
import 'package:spadarstva/core/theme/app_colors.dart';
import 'package:spadarstva/core/theme/app_text_styles.dart';
import 'package:spadarstva/generated/locales.g.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultView(
      showIndicator: controller.loadingIndicatorShowing,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            LocaleKeys.profile.tr,
            style: AppTextStyles.pageTitle,
          ),
          actions: [
            IconButton(
              onPressed: controller.logout,
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.backgroundSecondary,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      CircleAvatar(
                        backgroundColor: AppColors.backgroundSecondary,
                        radius: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            controller.user.value.photoUrl ?? '',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        controller.user.value.name ?? '',
                        style: AppTextStyles.title,
                      ),
                      Text(
                        controller.user.value.email ?? '',
                        style: AppTextStyles.regular,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PageTitle(
                        title: LocaleKeys.members.tr,
                        onPressed: controller.user.value.group != null
                            ? controller.addMember
                            : null,
                      ),
                      controller.user.value.group == null
                          ? InkWell(
                              highlightColor: AppColors.backgroundSecondary,
                              onTap: controller.addGroup,
                              borderRadius: BorderRadius.circular(16),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: AppTextStyles.regular,
                                    children: [
                                      TextSpan(
                                          text: LocaleKeys.newGroupFirst.tr),
                                      TextSpan(
                                        text: LocaleKeys.newGroupSecond.tr,
                                        style: AppTextStyles.regularBold,
                                      ),
                                      TextSpan(
                                          text: LocaleKeys.newGroupThird.tr),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Column(
                              children: List.generate(
                                controller.groupUsers.length,
                                (index) {
                                  var user = controller.groupUsers[index];
                                  return AppTile(
                                    avatar: Image.network(user.photoUrl!),
                                    label: user.name!,
                                    other: const Icon(Icons.more_vert),
                                    onTap: () => controller.memberControl(user),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PageTitle(
                      title: LocaleKeys.other.tr,
                    ),
                    AppTile(
                      avatar: const Icon(Icons.settings, size: 20),
                      label: LocaleKeys.settings.tr,
                      other: const Icon(Icons.navigate_next),
                      onTap: controller.goToSettings,
                    ),
                    AppTile(
                      avatar: const Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: AppColors.error,
                      ),
                      label: LocaleKeys.deleteProfile.tr,
                      other: const Icon(
                        Icons.navigate_next,
                        color: AppColors.error,
                      ),
                      onTap: controller.deleteProfile,
                      avatarBackgroundColor: AppColors.errorLight,
                      labelStyle: AppTextStyles.title.copyWith(
                        color: AppColors.error,
                      ),
                      selectionColor: AppColors.errorLight,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
