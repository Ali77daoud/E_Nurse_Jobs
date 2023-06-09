import 'package:e_nurse_jobs/utils.dart/app_colors.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool isPrefix;
  final bool isObscure;
  final TextInputType textInputType;
  final int maxLines;
  final bool isHintColor;
  // final String initValue;
  // ignore: prefer_typing_uninitialized_variables
  final validator;
  // ignore: prefer_typing_uninitialized_variables
  final onChange;
  const AuthTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.prefixIcon,
      required this.isPrefix,
      required this.validator,
      this.isHintColor = false,
      this.onChange,
      this.suffixIcon = const SizedBox(
        width: 0,
      ),
      this.isObscure = false,
      this.maxLines = 1,
      this.textInputType = TextInputType.text,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // initialValue: initValue,
      controller: controller,
      keyboardType: textInputType,
      cursorColor: AppColors.primaryDark,
      validator: validator,
      obscureText: isObscure,
      maxLines: maxLines,
      onChanged: onChange,
      style: const TextStyle(
        color: AppColors.primaryDark,
        fontWeight: FontWeight.normal,
        fontFamily: 'EuclidCircularARegular',
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.lightGray,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        prefixIcon: isPrefix ? prefixIcon : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
