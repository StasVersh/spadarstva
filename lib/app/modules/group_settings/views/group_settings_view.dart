import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spadarstva/app/global_widgets/app_tile.dart';
import 'package:spadarstva/app/global_widgets/default_view.dart';
import 'package:spadarstva/app/modules/group_settings/controllers/group_settings_controller.dart';
import 'package:spadarstva/core/theme/app_text_styles.dart';
import 'package:spadarstva/core/values/app_values.dart';
import 'package:spadarstva/generated/locales.g.dart';

class GroupSettingsView extends GetView<GroupSettingsController> {
  const GroupSettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultView(
      showIndicator: controller.loadingIndicatorShowing,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            LocaleKeys.settings.tr,
            style: AppTextStyles.title,
          ),
          leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(Icons.navigate_before),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppTile(
                  avatar: const Icon(Icons.language, size: 20),
                  label: LocaleKeys.language.tr,
                  other: Obx(
                    () => DropdownButton<String>(
                      value: controller.selectedLanguage.value,
                      elevation: 16,
                      borderRadius: BorderRadius.circular(16),
                      onChanged: controller.setLanguage,
                      items: AppValues.locales
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value.tr),
                        );
                      }).toList(),
                    ),
                  ),
                  labelStyle: AppTextStyles.regularBold.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
