import 'package:cook_app/core/utils/app_colors.dart';
import 'package:cook_app/core/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String text1;
  final String? text2;
  final String? text3;
  final void Function()? fun;
  final double fontSize;

  const CustomRichText(
      {super.key,
      required this.text1,
      this.text2,
      this.text3,
      this.fun,
      this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: text1,
          style: Styles.textStyle14.copyWith(height: 1.7, fontSize: fontSize),
          children: [
            TextSpan(text: text2, style: Styles.textStyle14),
            TextSpan(
                text: text3,
                style: Styles.textStyle14.copyWith(
                    color: AppColors.kPrimaryColor, fontSize: fontSize),
                recognizer: TapGestureRecognizer()..onTap = fun),
          ]),
    );
  }
}
