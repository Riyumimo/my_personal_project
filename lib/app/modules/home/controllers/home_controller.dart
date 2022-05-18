import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_personal_project/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  logOut(){
    firebaseAuth.signOut();
    Get.offAllNamed(Routes.LOGIN_PAGE);
  }

}
