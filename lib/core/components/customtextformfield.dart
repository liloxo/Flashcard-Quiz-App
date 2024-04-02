import 'package:codealpha_flashcard_quiz_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? mycontroller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String labeltext;
  final Widget? prefixIcon;
  final String? Function(String?)? valid;
  final Widget? suffixIcon;
  final int? maxLength;
  final bool enabled;
  const CustomTextFormField(
      {super.key,
      this.maxLength,
      this.mycontroller,
      this.keyboardType,
      this.hintText,
      required this.labeltext,
      this.prefixIcon,
      this.valid,
      this.suffixIcon,
      required this.enabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      maxLines: 3,
      enabled: enabled,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 1),
      controller: mycontroller,
      validator: valid,
      keyboardType: keyboardType,
      cursorColor: AppColors.secondary,
      decoration: InputDecoration(
          focusColor: AppColors.secondary,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(width: 2.2, color: AppColors.secondary)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          label: Text(labeltext,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          //floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.secondary,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.grey),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
