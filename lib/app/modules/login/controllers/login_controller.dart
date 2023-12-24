import 'package:get/get.dart';
import 'package:spadarstva/app/data/services/auth_services.dart';
import 'package:spadarstva/app/global_widgets/app_getx_controller.dart';
import 'package:spadarstva/app/routes/app_pages.dart';

class LoginController extends AppGetxController {
  final AuthServices authServices;

  LoginController(this.authServices);

  Future signInWithGoogle() async{
    showLoadingIndicator();
    var userLogIn = await authServices.signInWithGoogle();
    hideLoadingIndicator();
    if(userLogIn){
      Get.offNamed(Routes.HOME);
    }
  }
}
