import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hostel/constants.dart';

import '../../../components/default_button.dart';
import '../../../components/login_background.dart';
import '../../../components/social_media_login.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoginBackground(
      height: 300,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 22),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Column(
            children: [
              FittedBox(
                  child: Text(
                "Welcome to Smart Hostel".toUpperCase(),
                style: const TextStyle(
                    color: kTextLiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )),
              h10(),
              const Text(
                "If you already have an account, please sign in.\nOtherwise, sign up.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 30,),
              DefaultButton(
                text: "Sign in".toUpperCase(),
                onTap: (){
                  Get.offAllNamed('/sign-in');
                },
                showBorderOnly: false,
              ),
              h10(),
              h10(),
              DefaultButton(
                text: "Sign Up".toUpperCase(),
                onTap: (){
                  Get.offAllNamed('/sign-up');
                },
                showBorderOnly: true,
              ),
            ],
          ),
        ),
        h10(),
        h10(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kGradientLine(colors: [
              Colors.black.withOpacity(0),
              Colors.black,
            ]),
            const SizedBox(width: 20,),
            const Text("OR CONNECT OTHER",style: TextStyle(color: kTextLiteColor)),
            const SizedBox(width: 20,),
           kGradientLine(colors: [
             Colors.black,
             Colors.black.withOpacity(0),])
          ],
        ),
        h10(),
        h10(),
        //socialMediaLogin
        const SocialMediaLogin(),
      ],
    ));
  }

  SizedBox h10() => const SizedBox(
        height: 10,
      );
}




