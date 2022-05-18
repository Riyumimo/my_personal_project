import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_personal_project/app/routes/app_pages.dart';
import 'package:my_personal_project/constant.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demoData.length,
                  controller: controller.pageController,
                  onPageChanged: controller.pageIndex,
                  itemBuilder: (context, index) => OnBoardingWidget(
                    image: demoData[index].image,
                    title: demoData[index].title,
                    decription: demoData[index].dedecription,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Obx(() => DotIndicator(
                          isActive: controller.pageIndex.value == index)),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.pageIndex.value == 2) {
                           Get.offAllNamed(Routes.LOGIN_PAGE);
                        }else{

                        controller.pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                        }
                      },
                      style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                      child: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: isActive ? 12 : 4,
        width: 4,
        decoration: BoxDecoration(
          color:isActive? primaryColor:primaryColor.withOpacity(0.4),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, dedecription;

  Onboard(
      {required this.image, required this.title, required this.dedecription});
}

final List<Onboard> demoData = [
  Onboard(
      image: 'assets/logo/onboard1.png',
      title: "Find the item you've \nbeen looking for",
      dedecription:
          "Here you'll see rich varietes of goods,carefully classified for \nseamless browsing experience"),
  Onboard(
      image: 'assets/logo/onboard2.png',
      title: "Find the item you've \nbeen looking for",
      dedecription:
          "Here you'll see rich varietes of goods,carefully classified for \nseamless browsing experience"),
  Onboard(
      image: 'assets/logo/onboard3.png',
      title: "Find the item you've \nbeen looking for",
      dedecription:
          "Here you'll see rich varietes of goods,carefully classified for \nseamless browsing experience"),
];

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.decription,
  }) : super(key: key);

  final String image, title, decription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Image.asset(image),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          decription,
          textAlign: TextAlign.center,
        ),
        const Spacer()
      ],
    );
  }
}
