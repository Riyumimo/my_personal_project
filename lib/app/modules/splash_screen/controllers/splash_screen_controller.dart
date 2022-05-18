import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController
    late PageController pageController ; 
    var pageIndex = 0.obs;
    

  @override
  void onInit() {
    pageController= PageController(initialPage: 0);

    super.onInit();
  }


  @override
  void onClose() {
    pageController.dispose();
     
  }
}
