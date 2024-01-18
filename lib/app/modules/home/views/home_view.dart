import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spadarstva/app/modules/home/controllers/home_controller.dart';
import 'package:spadarstva/app/modules/home/tabs/main/views/main_view.dart';
import 'package:spadarstva/app/modules/home/tabs/profile/views/profile_view.dart';
import 'package:spadarstva/core/theme/app_colors.dart';
import 'package:spadarstva/core/theme/app_text_styles.dart';
import 'package:spadarstva/generated/locales.g.dart';

class HomeView extends GetView<HomeController> {
  final pages = [const MainView(), const ProfileView()];

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: pages.length,
        controller: controller.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (value) => controller.selectedPageIndex.value = value,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.background,
          selectedItemColor: AppColors.text,
          onTap: controller.onSelectPage,
          currentIndex: controller.selectedPageIndex.value,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedLabelStyle: AppTextStyles.regularBold.copyWith(
            fontWeight: FontWeight.w600,
          ),
          selectedIconTheme: const IconThemeData(
            size: 30,
          ),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: LocaleKeys.main.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: LocaleKeys.profile.tr,
            ),
          ],
        ),
      ),
    );
  }
}
