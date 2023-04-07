import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class LoginBackground extends StatelessWidget {
  LoginBackground({Key? key,
    this.edibleTitle = false,
    this.title,
    this.subTitle,
    this.height=400,
    required this.children,
  }) : super(key: key);

  final bool edibleTitle;
  String? title;
  String? subTitle;
  final double height;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: height,
                  width: Get.width,
                  decoration: const BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )
                  ),
                  child: edibleTitle==false?
                  Center(
                    child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/15)),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child:SvgPicture.asset("assets/icons/logo.svg",width: height/5,),
                        )),
                  ):Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/16)),
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child:SvgPicture.asset("assets/icons/logo.svg",width: height/6,),
                          )),
                      h10(),
                      Text(title!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500
                          )),
                      h10(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Text(subTitle!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ),

                    ],
                  ),
                )),
            Positioned(
                bottom: 30,
                right: 0,
                child: SvgPicture.asset("assets/icons/BG_Line.svg")),
            Positioned(
              top: height-60,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                child:ListView(
                  physics: const BouncingScrollPhysics(),
                  children:children,
                ),
              ),
            )
          ],
        )
    );
  }

  SizedBox h10() => const SizedBox(height: 10,);
}