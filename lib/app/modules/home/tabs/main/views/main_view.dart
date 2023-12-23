import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spadarstva/app/modules/home/tabs/main/controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Main'),
      ),
    );
  }
}
