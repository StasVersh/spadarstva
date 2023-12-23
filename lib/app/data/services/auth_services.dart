import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spadarstva/app/data/services/user_services.dart';

class AuthServices extends GetxService {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  AuthServices(this.firebaseAuth);

  Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await firebaseAuth.signInWithCredential(credential);
      final User? user = authResult.user;

      if(user != null){
        await Get.find<UserServices>().addUser(user);
        await Get.find<UserServices>()
            .setCurrentUser(firebaseAuth.currentUser?.uid);
      }

      return user != null;
    }
    return false;
  }

  bool isAuth() => firebaseAuth.currentUser != null;

  Future logout() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }

  @override
  User? getCurrentAuthUser() => firebaseAuth.currentUser;

  Future delete() async {
    if (firebaseAuth.currentUser != null) {
      firebaseAuth.currentUser!.delete();
    }
  }
}
