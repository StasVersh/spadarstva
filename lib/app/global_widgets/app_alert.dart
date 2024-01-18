import 'package:flutter/material.dart';
import 'package:spadarstva/core/theme/app_colors.dart';
import 'package:spadarstva/core/theme/app_text_styles.dart';

class AppAlert extends StatelessWidget {
  final String text;
  final String description;
  final String submitText;
  final String discardText;
  final void Function()? onSubmit;
  final void Function()? onDiscard;

  const AppAlert({
    super.key,
    required this.text,
    required this.description,
    required this.submitText,
    required this.discardText,
    this.onSubmit,
    this.onDiscard,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.background,
      title: Text(text, style: AppTextStyles.pageTitle),
      content: Text(description, style: AppTextStyles.regular),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: onDiscard,
              child: Text(
                discardText,
                style: AppTextStyles.regular,
              ),
            ),
            TextButton(
              onPressed: onSubmit,
              child: Text(
                submitText,
                style: AppTextStyles.regularBold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
