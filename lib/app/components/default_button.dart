import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.onTap,
    required this.text,
    this.showBorderOnly = false,
    this.borderColor=kPrimaryColor,
    this.buttonColor = kPrimaryColor,
  });

  final VoidCallback onTap;
  final String text;
  final bool showBorderOnly;
  final Color borderColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: showBorderOnly==false? buttonColor:null,
        borderRadius: BorderRadius.circular(10),
        border:showBorderOnly==true? Border.all(color: borderColor,width: 3, ):null,
      ),
      child: Material(
        color: Colors.transparent,
        child:  InkWell(
          onTap: onTap,
          child:  SizedBox(
            width: Get.width,
            height: 45,
            child: Center(child: FittedBox(
              child: Text(text,style: TextStyle(
                  color: showBorderOnly==true?kPrimaryColor:Colors.white,
                  shadows: [
                    Shadow(
                        color:showBorderOnly==false? Colors.black.withOpacity(0.3):Colors.transparent,
                        offset: const Offset(2, 2),
                        blurRadius: 10
                    )
                  ],
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2
              ),),
            )),
          ),
        ),
      ),
    );
  }
}