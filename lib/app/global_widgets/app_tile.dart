import 'package:flutter/material.dart';
import 'package:spadarstva/core/theme/app_colors.dart';
import 'package:spadarstva/core/theme/app_text_styles.dart';

class AppTile extends StatelessWidget {
  final Widget avatar;
  final String label;
  final Widget other;
  final TextStyle? labelStyle;
  final Color? avatarBackgroundColor;
  final Color? selectionColor;
  final Function()? onTap;

  const AppTile({
    super.key,
    required this.avatar,
    required this.label,
    required this.other,
    this.labelStyle,
    this.onTap,
    this.avatarBackgroundColor,
    this.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          highlightColor: selectionColor ?? AppColors.backgroundSecondary,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor:
                      avatarBackgroundColor ?? AppColors.backgroundSecondary,
                  radius: 18,
                  child: avatar,
                ),
                const SizedBox(width: 8),
                Text(label, style: labelStyle ?? AppTextStyles.title),
                const Spacer(),
                other,
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
