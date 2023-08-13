import 'package:cook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle textStyle24 = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.kPrimartTextColor);

  static TextStyle textStyle14 = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.kSecondryTextColor);

  static TextStyle textStyle14W500 = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.kPrimartTextColor);

  static TextStyle textStyle12 = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.kPrimaryColor);
}
