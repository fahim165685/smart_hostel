import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_hostel/app/components/default_button.dart';
import 'package:smart_hostel/app/components/login_background.dart';
import 'package:smart_hostel/app/modules/sign_in/views/sign_in_success.dart';
import 'package:smart_hostel/constants.dart';

import '../../../components/social_media_login.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Obx(() => Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: LoginBackground(
                height: 300,
                edibleTitle: true,
                title: "Sign in".toUpperCase(),
                subTitle:
                    "Lorem Ipsum Dolor Sit Amet, Consecrate Disci- plining Elite Sse ",
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 22),
                    padding: const EdgeInsets.only(
                      top: 25,
                      bottom: 5,
                      left: 15,
                      right: 15,
                    ),
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      children: [
                        //Emile
                        TextFormField(
                          validator: (emile) {
                            bool isValid = kEmailValid.hasMatch(emile.toString());
                            if (emile!.isEmpty) {
                              return kEmailNullError;
                            } else if (isValid == false) {
                              return kInvalidEmailError;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emileCon,
                          decoration: const InputDecoration(hintText: "Emile"),
                        ),
                        h10(),
                        h10(),
                        // Password
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.passVisible.value,
                          controller: controller.passCon,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return kPassNullError;
                            } else if (value.length < 6) {
                              return kShortPassError;
                            } else if (value.length > 15) {
                              return 'Should Not Be More Than 15 Characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () {
                                    controller.passVisible.value =
                                        !controller.passVisible.value;
                                  },
                                  child: (controller.passVisible.value) == false
                                      ? const Icon(Icons.visibility_outlined)
                                      : const Icon(
                                          Icons.visibility_off_outlined)),
                              hintText: "Password"),
                        ),
                        h10(),
                        h10(),
                        TextFormField(
                          controller: controller.IDCon,
                          keyboardType: TextInputType.text,
                          validator: (id) {
                            if (id!.isEmpty) {
                              return "Please Enter your ID";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(hintText: "ID"),
                        ),
                        h10(),
                        h10(),
                        DefaultButton(onTap: () {
                          Get.offAll( ()=> const SignInSuccess());
                          final isValidFrom = formKey.currentState!.validate();
                          if (isValidFrom) {
                            print("object");
                          }
                        }, text: "SIGN IN"),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {},
                            style: const ButtonStyle(
                              foregroundColor:
                                  MaterialStatePropertyAll(kPrimaryColor),
                            ),
                            child: const Text("Forgot Password",
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                          ),
                        )
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
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("OR CONNECT OTHER",
                          style: TextStyle(color: kTextLiteColor)),
                      const SizedBox(
                        width: 20,
                      ),
                      kGradientLine(colors: [
                        Colors.black,
                        Colors.black.withOpacity(0),
                      ])
                    ],
                  ),
                  h10(),
                  h10(),
                  //socialMediaLogin
                  const SocialMediaLogin(),
                  h10(),
                  // Don't have a account? S Sing up
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: RichText(
                          text: const TextSpan(
                              text: "Don't have a account?",
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 15,
                              ),
                              children: [
                            TextSpan(
                                text: " Sing up",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 15,
                                ))
                     ])),
                    ),
                  )
                ],
              ),
        )),
      ),
    );
  }

  SizedBox h10() => const SizedBox(
        height: 10,
      );
}
