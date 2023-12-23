import 'package:get/get.dart';

class MainController extends GetxController {
  final selectedPageIndex = 0.obs;

  void onSelectPage(int index) {
    selectedPageIndex.value = index;
  }
}
