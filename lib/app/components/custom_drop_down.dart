
import 'package:flutter/material.dart';

import '../../constants.dart';


//ignore: must_be_immutable
class CustomDropdown extends StatelessWidget {
  CustomDropdown({
    super.key,
    this.value,
    this.items,
    required this.onChanged,
    required this.labelText,
    required this.validator,
  });

  String? value;
  List<String>? items;
  final String labelText;
  final String? Function(String?) validator;
  void Function(Object?) onChanged;

  @override
  Widget build(BuildContext context) {
    return   DropdownButtonFormField(
      value: value,
      validator: validator,
      items:items!.map((e) {
        return DropdownMenuItem(
          value: e,
          child: FittedBox(
            child: Text(e,style: const TextStyle(
                color: kTextLiteColor,
                fontSize: 18
            ),),
          ),
        );
      }).toList(),
      dropdownColor: Colors.white,
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: kPrimaryColor,
      ),
      borderRadius: BorderRadius.circular(5),
      onChanged: onChanged,
      decoration: InputDecoration(
        //floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: labelText,
      ),

    );
  }
}
