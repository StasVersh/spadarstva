import 'package:get/get.dart';
import 'package:spadarstva/app/data/services/auth_services.dart';
import 'package:spadarstva/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthServices authServices;

  LoginController(this.authServices);

  Future signInWithGoogle() async{
    var userLogIn = await authServices.signInWithGoogle();
    if(userLogIn){
      Get.offNamed(Routes.HOME);
    }
  }
}
