import 'package:cook_app/core/utils/app_colors.dart';
import 'package:cook_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType type;
  final String? Function(String? val) validator;
  final bool? obscureText;
  final Widget? suffix;
  final IconData? suffixIcon;
  final TextInputAction textInputAction;
  final VoidCallback? suffixFun;
  final double height;
  final FocusNode? focusNode;
  final bool icon;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.hintText,
      required this.type,
      this.icon = false,
      this.suffix,
      required this.validator,
      this.obscureText = false,
      this.suffixIcon,
      this.suffixFun,
      required this.textInputAction,
      this.focusNode,
      this.height = 44});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(
            decoration: TextDecoration.none, decorationThickness: 0),
        validator: validator,
        textInputAction: textInputAction,
        focusNode: focusNode,
        controller: controller,
        autocorrect: false,
        keyboardType: type,
        obscureText: obscureText!,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15.0),
          ),
          fillColor: const Color(0xffF4F5F7),
          filled: true,
          contentPadding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
          hintText: hintText,
          hintStyle: Styles.textStyle14,
          suffixIcon: icon
              ? suffix
              : IconButton(
                  icon: Icon(
                    suffixIcon,
                    color: const Color(0xffC1C7D0),
                    size: 20,
                  ),
                  onPressed: suffixFun),
        ));
  }
}
