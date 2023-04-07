import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smart_hostel/app/components/default_button.dart';
import 'package:smart_hostel/app/components/login_background.dart';

class SignInSuccess extends StatelessWidget {
  const SignInSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(
        height: 300,
        children: [
      Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      padding:  const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 25,),
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
        child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("LOGIN SUCCESS!!",style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 2
            ),),
            const SizedBox(height: 20,),
            SvgPicture.asset("assets/icons/success_icon.svg",width: Get.width *0.6,),
            const SizedBox(height: 20,),
            DefaultButton(onTap: (){}, text: "Go to Home".toUpperCase())
          ],
        ),
      ),
        ],
      ),
    );
  }
}
