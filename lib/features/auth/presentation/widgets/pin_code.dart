// ignore_for_file: must_be_immutable

import 'package:cook_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCode extends StatelessWidget {
  TextEditingController controller;

  PinCode({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      controller: controller,
      cursorColor: const Color(0xff606060),
      cursorHeight: 16,
      keyboardType: TextInputType.number,
      autoDisposeControllers: false,
      enableActiveFill: true,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textStyle: const TextStyle(
          fontSize: 16, fontFamily: 'DM Sans', color: Color(0xff606060)),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        fieldHeight: 65,
        fieldWidth: 65,
        inactiveColor: const Color(0xffF4F5F7),
        activeColor: const Color(0xffF4F5F7),
        activeFillColor: const Color(0xffF4F5F7),
        inactiveFillColor: const Color(0xffF4F5F7),
        selectedFillColor: const Color(0xffF4F5F7),
        selectedColor: AppColors.kPrimaryColor,
        borderWidth: 1,
        borderRadius: BorderRadius.circular(15),
      ),
      onChanged: (value) {},
    );
  }
}
