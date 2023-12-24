import 'package:get/get.dart';

class AppGetxController extends GetxController {
  final RxBool loadingIndicatorShowing = false.obs;

  void showLoadingIndicator() => loadingIndicatorShowing.value = true;

  void hideLoadingIndicator() => loadingIndicatorShowing.value = false;
}
