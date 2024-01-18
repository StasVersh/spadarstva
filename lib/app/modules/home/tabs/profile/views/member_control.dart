import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spadarstva/app/data/models/user.dart';
import 'package:spadarstva/app/global_widgets/app_alert.dart';
import 'package:spadarstva/app/global_widgets/app_tile.dart';
import 'package:spadarstva/app/modules/home/tabs/profile/controllers/profile_controller.dart';
import 'package:spadarstva/core/theme/app_colors.dart';
import 'package:spadarstva/core/theme/app_text_styles.dart';

class MemberControl extends GetView<ProfileController> {
  final User user;

  const MemberControl(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        user.photoUrl!,
                        height: 50,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name!,
                          style: AppTextStyles.pageTitle,
                        ),
                        Text(
                          user.email!,
                          style: AppTextStyles.regular,
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
            AppTile(
              avatar: const Icon(
                Icons.delete_outline,
                size: 20,
                color: AppColors.error,
              ),
              label: 'Исключить из группы',
              other: const Icon(
                Icons.navigate_next,
                color: AppColors.error,
              ),
              onTap: () async {
                Get.dialog(
                  AppAlert(
                    text: 'Исключить из группы',
                    description:
                        'Вы уверенны что хотите исключить этого пользователя из группы?',
                    submitText: 'Отмена',
                    discardText: 'Исключть',
                    onSubmit: Get.back,
                    onDiscard: () => controller.bunMember(user),
                  ),
                );
              },
              avatarBackgroundColor: AppColors.errorLight,
              labelStyle: AppTextStyles.title.copyWith(
                color: AppColors.error,
              ),
              selectionColor: AppColors.errorLight,
            ),
          ],
        ),
      ),
    );
  }
}
