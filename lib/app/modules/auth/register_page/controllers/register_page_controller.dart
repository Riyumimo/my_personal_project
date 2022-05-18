import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_personal_project/service/firebase_auth_method.dart';

class RegisterPageController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  Future signUp(BuildContext context) async {
    if (emailC.text.isEmpty || passwordC.text.isEmpty) {
      Get.snackbar('Hi', 'Harap Masukkan Email dan password anda');
    }

    if (emailC.text.isEmail) {
      if (passwordC.text.length <= 6) {
        FirebaseAuthMethods firebaseAuthMethods = FirebaseAuthMethods(_auth);
       await firebaseAuthMethods.signUpWithEmail(
            email: emailC.text, password: passwordC.text, context: context);
      }
    } else {
      Get.snackbar('Hi', 'Harap Masukkan Email dengan benar');
    }
  }

  // Future signupGoggle(BuildContext context) async{
  //    FirebaseAuthMethods firebaseAuthMethods = FirebaseAuthMethods(_auth);
  //   await firebaseAuthMethods.signInWithGoogle(context);

  // }
}
