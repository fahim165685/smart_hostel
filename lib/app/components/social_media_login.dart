import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 22),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Google
            buildCard(
                onTap: (){},
                icon: "assets/icons/google.svg"
            ),
            //Facebook
            buildCard(
                onTap: (){},
                icon: "assets/icons/facebook.svg"
            ),
            //Phone Number
            buildCard(
                onTap: (){},
                icon: "assets/icons/call.svg"
            ),
          ],
        )
    );
  }

  Container buildCard({required String icon, required VoidCallback onTap }) {
    return Container(
      decoration: BoxDecoration(
        color: kBGColor,
        border: Border.all(color: kPrimaryLightColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child:  InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          splashColor: kPrimaryLightColor.withOpacity(0.6),
          child:  SizedBox(
              width: 50,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(icon),
              )
          ),
        ),
      ),
    );
  }
}