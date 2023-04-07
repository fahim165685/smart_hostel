import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hostel/app/components/default_button.dart';

import '../../../../constants.dart';
import '../../../components/custom_drop_down.dart';
import '../../../components/login_background.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Obx(() => Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: LoginBackground(
                height: 300,
                edibleTitle: true,
                title: "Sign Up".toUpperCase(),
                subTitle:
                    "Lorem Ipsum Dolor Sit Amet, Consecrate Disci- plining Elite Sse ",
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 22),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 25,
                    ),
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.firstNameCon,
                          decoration: const InputDecoration(
                            hintText: "First name",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your first name";
                            }
                            return null;
                          },
                        ),
                        h15(),
                        TextFormField(
                          controller: controller.lastNameCon,
                          decoration: const InputDecoration(
                            hintText: "Last name",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your first name";
                            }
                            return null;
                          },
                        ),
                        h15(),
                        TextFormField(
                          controller: controller.emileCon,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Emile",
                          ),
                          validator: (emile) {
                            bool isValid =
                                kEmailValid.hasMatch(emile.toString());
                            if (emile!.isEmpty) {
                              return kEmailNullError;
                            } else if (isValid == false) {
                              return kInvalidEmailError;
                            }
                            return null;
                          },
                        ),
                        h15(),
                        TextFormField(
                          maxLength: 11,
                          controller: controller.phoneNumberCon,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: "Phone",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return kEmailNullError;
                            } else if (value.isNum == false) {
                              return "Enter Valid Number";
                            } else if (value.length < 11 ||
                                value.length >= 12) {
                              return kShortPassError;
                            }
                            return null;
                          },
                        ),
                        h15(),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.passVisible.value,
                          controller: controller.passwordCon,
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
                        h15(),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.confirmPassVisible.value,
                          validator: (value) {
                            bool cak =
                                value.toString() == controller.passwordCon.text;
                            if (value!.isEmpty) {
                              return kPassNullError;
                            } else if (cak == false) {
                              return kMatchPassError;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: () {
                                    controller.confirmPassVisible.value =
                                        !controller.confirmPassVisible.value;
                                  },
                                  child: (controller
                                              .confirmPassVisible.value) ==
                                          false
                                      ? const Icon(Icons.visibility_outlined)
                                      : const Icon(
                                          Icons.visibility_off_outlined)),
                              hintText: "Confirm Password"),
                        ),
                        h15(),
                        TextFormField(
                          controller: controller.homeAddressCon,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Home Address";
                            }
                            return null;
                          },
                          decoration:
                              const InputDecoration(hintText: "Home Adders"),
                        ),
                        h15(),
                        CustomDropdown(
                          validator: (value) {
                            if (value == null) {
                              return "Select your Gender";
                            }
                            return null;
                          },
                          items: controller.genderItem,
                          labelText: "Gender",
                          onChanged: (value) {
                            controller.genderSel.value = value!.toString();
                          },
                        ),
                        h15(),
                        CustomDropdown(
                          validator: (value) {
                            if (value == null) {
                              return "Select your Religion";
                            }
                            return null;
                          },
                          items: controller.religionItem,
                          labelText: "Religion",
                          onChanged: (value) {
                            controller.religionSel.value = value!.toString();
                          },
                        ),
                        h15(),
                        CustomDropdown(
                          validator: (value) {
                            if (value == null) {
                              return "Select your Profession";
                            }
                            return null;
                          },
                          items: controller.professionItem,
                          labelText: "Profession",
                          onChanged: (value) {
                            controller.professionSel.value = value!.toString();
                          },
                        ),
                        h15(),
                        TextFormField(
                          controller: controller.NIDCon,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your NID ";
                            }
                            return null;
                          },
                          decoration:
                          const InputDecoration(hintText: "NID"),
                        ),
                        DefaultButton(onTap: () {}, text: "text")
                      ],
                    ),
                  )
                ]),
          )),
    );
  }

  SizedBox h15() => const SizedBox(
        height: 15,
      );

  String? _validateDropdownValue(String value) {
    if (value == null) {
      return 'Please select an option';
    }
    return null;
  }
}
