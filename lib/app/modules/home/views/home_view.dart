import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body:  Center(
        child: SvgPicture.asset("assets/icons/adjust fan.svg",width: Get.width,color: Colors.red,colorFilter: ColorFilter.mode(Colors.yellowAccent, BlendMode.overlay),))
    );
  }
}
