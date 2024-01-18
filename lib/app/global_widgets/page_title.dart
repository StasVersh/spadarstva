import 'package:flutter/material.dart';
import 'package:spadarstva/core/theme/app_colors.dart';
import 'package:spadarstva/core/theme/app_text_styles.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final IconData? icon;

  const PageTitle({super.key, required this.title, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.pageTitle,
            ),
            Visibility(
              visible: onPressed != null,
              child: InkWell(
                highlightColor: AppColors.backgroundSecondary,
                borderRadius: BorderRadius.circular(10),
                onTap: onPressed,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(icon ?? Icons.add, size: 20),
                ),
              ),
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}
