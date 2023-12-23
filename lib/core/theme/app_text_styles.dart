import 'package:flutter/material.dart';
import 'package:spadarstva/core/theme/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle pageTitle = const TextStyle(
    color: AppColors.text,
    fontSize: 24,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
  );
  static TextStyle title = const TextStyle(
    color: AppColors.text,
    fontSize: 20,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
  );
  static TextStyle regular = const TextStyle(
    color: AppColors.text,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );
}
