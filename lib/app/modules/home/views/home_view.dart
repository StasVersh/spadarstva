import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spadarstva/app/modules/home/controllers/home_controller.dart';
import 'package:spadarstva/app/modules/home/tabs/main/views/main_view.dart';
import 'package:spadarstva/app/modules/home/tabs/profile/views/profile_view.dart';
import 'package:spadarstva/core/theme/app_colors.dart';

class HomeView extends GetView<HomeController> {
  final pages = [const MainView(), const ProfileView()];

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedPageIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.background,
          selectedItemColor: AppColors.primary,
          onTap: controller.onSelectPage,
          currentIndex: controller.selectedPageIndex.value,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
