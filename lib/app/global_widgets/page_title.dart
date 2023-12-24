import 'package:flutter/material.dart';
import 'package:spadarstva/core/theme/app_text_styles.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const PageTitle({super.key, required this.title, this.onPressed});

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
              child: IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.add),
              ),
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}
