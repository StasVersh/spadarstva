import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spadarstva/app/modules/login/controllers/login_controller.dart';
import 'package:spadarstva/core/theme/app_colors.dart';
import 'package:spadarstva/core/theme/app_text_styles.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Spadarstva',
              style: AppTextStyles.pageTitle.copyWith(fontSize: 32),
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: controller.signInWithGoogle,
              child: Text(
                'SignIn with Google',
                style: AppTextStyles.title.copyWith(
                  color: AppColors.text.withAlpha(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
