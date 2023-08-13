import 'package:cook_app/core/utils/app_colors.dart';
import 'package:cook_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomIntlPhoneField extends StatelessWidget {
  final TextEditingController phoneCodeController;

  const CustomIntlPhoneField({super.key, required this.phoneCodeController});
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
        initialCountryCode: 'egypt',
        style: const TextStyle(
            decoration: TextDecoration.none,
            fontSize: 15,
            decorationThickness: 0),
        validator: (val) {
          return null;
        },
        controller: phoneCodeController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.kPrimaryColor),
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
          hintText: 'Phone Number',
          hintStyle: Styles.textStyle14,
        ));
  }
}
