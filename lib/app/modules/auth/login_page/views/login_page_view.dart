import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_personal_project/app/routes/app_pages.dart';
import 'package:my_personal_project/app/theme/input_decoration_theme.dart';
import 'package:my_personal_project/constant.dart';
import '../../../../../widgets/custom_snackbar.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LoginPageView'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(defaultPadding),
          children: [
            TextFormField(
              validator: (value) {
                if (value != emaildValidator) {
                  Get.snackbar('Error', 'Enter a valid email address');
                }
                return null;
              },
              controller: controller.emailController,
              decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "example@gmail.com",
                  border: outlineInputBorder),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: passwordValidator,
              controller: controller.passwordContoller,
              decoration: const InputDecoration(
                  labelText: "Password", border: outlineInputBorder),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.signIn();
                },
                child: const Text("Login..")),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                    content: CustomSnackBar(title: "Oh Snap",description:"Flutter Default SnackBar Showing",
                    colorBase: Color(0xFFC72C41) ,colorIcon:Color(0xFF801336), colorImage:Color(0xFF801336) ,),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ));
                },
                child: const Text("ShowsnackBar")),
            TextButton(
                onPressed: () {
                  Get.toNamed(Routes.REGISTER_PAGE);
                },
                child: const Text("belum punya akun?"))
          ],
        ));
  }
}

