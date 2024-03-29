import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spadarstva/app/global_widgets/loading.dart';
import 'package:spadarstva/core/theme/app_colors.dart';

class DefaultView extends StatelessWidget {
  final RxBool showIndicator;
  final Widget child;

  const DefaultView({
    required this.showIndicator,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          child,
          showIndicator.value
              ? AnimatedOpacity(
                  opacity: showIndicator.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 150),
                  child: const ColoredBox(
                    color: Colors.white70,
                    child: Loading(),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
