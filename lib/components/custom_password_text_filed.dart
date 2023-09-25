// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shopping_app/shared/constant.dart';

class CustomTextFiledPassword extends StatelessWidget {
  CustomTextFiledPassword({
    required this.prefixIcon,
    @required this.suffixIcon,
    required this.label,
    required this.inputText,
    required this.validate,
    @required this.onTap,
    @required this.controller,
    @required this.onChange,
    @required this.suffixPreesed,
    @required this.obscureText,
  });

  IconData prefixIcon;
  IconData? suffixIcon;
  String label;
  TextInputType inputText;
  bool? obscureText;
  String? Function(String?) validate;
  TextEditingController? controller;
  VoidCallback? onTap;
  Function(String?)? onChange;
  VoidCallback? suffixPreesed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      onTap: onTap,
      onChanged: onChange,
      validator: validate,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        prefixIcon: Icon(prefixIcon),
        suffix: IconButton(
          onPressed: suffixPreesed,
          icon: Icon(suffixIcon),
        ),
        label: Text(label),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kDefualtColor,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      controller: controller,
      keyboardType: inputText,
    );
  }
}
