import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_personal_project/app/routes/app_pages.dart';

class LoginPageController extends GetxController {
  final emailController = TextEditingController();
  final passwordContoller = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;



  Future signIn() async {
      await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text, password: passwordContoller.text);
      
      Get.offAllNamed(Routes.HOME);
  }
  
}
