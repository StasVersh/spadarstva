import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spadarstva/app/global_widgets/page_title.dart';
import 'package:spadarstva/app/modules/home/tabs/profile/controllers/profile_controller.dart';
import 'package:spadarstva/core/theme/app_colors.dart';
import 'package:spadarstva/core/theme/app_text_styles.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: AppTextStyles.title,
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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PageTitle(
                    title: 'Members',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
