import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final bool isObscure;
  const TextInputField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.prefixIcon,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 17.sp, color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: borderColor)),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.white,
          ),
          prefixIconColor: Colors.white,
        ));
  }
}
