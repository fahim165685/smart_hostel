import 'package:get/get.dart';

class OnboardingScreensController extends GetxController {
 var item = [
   {
   'image':"assets/icons/onboarding_2.svg",
   'title':"FIND PROBLEM",
   'subTitle':"Find the problems you are facing\nin your hostel",
   },
   {
     'image':"assets/icons/onboarding_1.svg",
     'title':"PROBLEM FACING",
     'subTitle':"Log in to your account and upload\nthe problems, you are facing",
   },
   {
     'image':"assets/icons/onboarding_3.svg",
     'title':"POST YOUR COMPLAINTS",
     'subTitle':"That's it! your problem will be Shown\nto the management and will\nbe solved soon",
   },
 ].obs;
 var currentPage = 0.obs;

 var buttonSeIndex = 0.obs;
 var buttonItem = ["ADMIN","USER",].obs;



}
