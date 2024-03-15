// ignore_for_file: must_be_immutable

import 'package:complete_login_form/constant/const.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;

  final Widget? suffixIcon;
  bool obscureText;
  String? Function(String?)? validator;
  final TextEditingController controller;
  TextFieldWidget(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.validator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 5,
            spreadRadius: 2,
            color: primaryColor.withOpacity(.2),
            offset: Offset(-1, 5)),
      ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              TextStyle(color: Colors.grey[700], fontFamily: 'Montserrat'),
          prefixIcon: prefixIcon,
          prefixIconColor: primaryColor,
          suffixIcon: suffixIcon,
          suffixIconColor: primaryColor,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 184, 44, 34), width: 2)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[600]!),
              borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
