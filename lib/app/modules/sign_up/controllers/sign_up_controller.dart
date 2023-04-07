
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  var passVisible = false.obs;
  var confirmPassVisible = false.obs;

  //<<<<<<<<<<<<<<<<<<<<<<<<<<<Dropdown Item>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  List<String> genderItem = ["Male", "Female", "Other"];
  var genderSel = "Male".obs;

  List<String> professionItem = ["Actor", "Actress", "Advocate", "Artist", "Baker", "Broker", "Student", "Teacher", "Other"];
  var professionSel = "Actor".obs;

  List<String> religionItem = ["Islam", "Hinduism", "Buddhism", "Christianity"];
  var religionSel = "Islam".obs;



  //  TextEditingController
  TextEditingController firstNameCon =TextEditingController();
  TextEditingController lastNameCon =TextEditingController();
  TextEditingController emileCon =TextEditingController();
  TextEditingController phoneNumberCon =TextEditingController();
  TextEditingController passwordCon =TextEditingController();
  TextEditingController homeAddressCon =TextEditingController();
  TextEditingController NIDCon =TextEditingController();
  TextEditingController aboutYourSelfCon =TextEditingController();

}
