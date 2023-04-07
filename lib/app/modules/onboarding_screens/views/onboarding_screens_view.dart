import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../components/custom_button.dart';
import '../controllers/onboarding_screens_controller.dart';

class OnboardingScreensView extends GetView<OnboardingScreensController> {
  const OnboardingScreensView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Column(
              children: [
                //Slider
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.item.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  controller.item[index]['image']!,
                                  width: Get.width * 0.8,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(controller.item[index]['title']!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: kTextLiteColor,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(controller.item[index]['subTitle']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 16, color: kTextColor)),
                              ],
                            );
                          },
                          onPageChanged: (value) {
                            controller.currentPage.value = value;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(controller.item.length,
                              (index) => buildDot(index: index))
                        ],
                      )
                    ],
                  ),
                ),
                //Button & Text
                const Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Text("LOREM IPSUM, GIVING\nINFORMATION ON",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kTextLiteColor, fontSize: 25,fontWeight: FontWeight.w500)),
                    Spacer(
                      flex: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kTextColor, fontSize: 15,)),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    CustomButton(
                      adminPage: "",
                      userPage: "/login",
                    ),
                    Spacer(flex: 2),
                  ],
                )),
              ],
            )));
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(right: 5),
      height: 15,
      width: controller.currentPage.value == index ? 40 : 15,
      decoration: BoxDecoration(
          color: controller.currentPage.value == index
              ? kPrimaryColor
              : const Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
