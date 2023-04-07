import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../controllers/onboarding_screens_controller.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.adminPage,
    required this.userPage,
  });
  final String adminPage;
  final String userPage;

  @override
  Widget build(BuildContext context) {
    OnboardingScreensController controller = Get.find();

    return Obx(() => Container(
          height: 60,
          width: 250,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(11),
              color: const Color(0xFFe8ecf5)),
          child: Row(
            children: List.generate(
              controller.buttonItem.length,
              (index) => Expanded(
                child: GestureDetector(
                  //borderRadius: BorderRadius.circular(10),
                  onTap: () async {
                    controller.buttonSeIndex.value = index;
                    await Future.delayed(const Duration(milliseconds: 400));
                    if (controller.buttonSeIndex.value == 0) {
                      print("Admin");
                      try {
                        Get.offAllNamed(adminPage);
                      } catch (e) {
                        Get.snackbar("Error", "No Page found",
                            snackPosition: SnackPosition.BOTTOM);
                      }

                    } else {
                      print("User");
                      try {
                        Get.offAllNamed(userPage);
                      } catch (e) {
                        Get.snackbar("Error", "No Page found",
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: 60,
                    width: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.buttonSeIndex.value == index
                          ? kPrimaryLightColor
                          : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      controller.buttonItem[index],
                      style: TextStyle(
                        color: controller.buttonSeIndex.value == index
                            ? kTextLiteColor
                            : Colors.grey[600],
                        fontSize: 18,
                        fontWeight: controller.buttonSeIndex.value == index
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
