import 'package:flutter/material.dart';

import 'app_colors.dart';

final appTheme = ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(color: AppColors.primaryDark),

  /// text form field theme

  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.white,
    filled: true,
    errorMaxLines: 3,
    labelStyle: const TextStyle(
        color: AppColors.primaryLight, fontWeight: FontWeight.bold),
    floatingLabelStyle: const TextStyle(
      color: AppColors.primaryLight,
      fontWeight: FontWeight.bold,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          style: BorderStyle.solid, color: AppColors.primaryDark, width: 2),
      borderRadius: BorderRadius.circular(30),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryDark, width: 2),
      borderRadius: BorderRadius.circular(30),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
          style: BorderStyle.solid, width: 1, color: Colors.red),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          style: BorderStyle.solid, color: AppColors.primaryDark, width: 2),
      borderRadius: BorderRadius.circular(30),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          style: BorderStyle.solid, color: AppColors.primaryDark, width: 2),
      borderRadius: BorderRadius.circular(30),
    ),
    prefixIconColor: AppColors.primaryLight,
    suffixIconColor: AppColors.primaryLight,
  ),
);
