import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spadarstva/core/theme/app_colors.dart';

class Loading extends StatelessWidget {
  final double size;
  const Loading({super.key, this.size = 150});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: const LoadingIndicator(
          indicatorType: Indicator.ballClipRotateMultiple,
          colors: [AppColors.text],
          strokeWidth: 8,
        ),
      ),
    );
  }
}
