import 'package:cook_app/core/utils/app_colors.dart';
import 'package:cook_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback? function;
  final bool isLoading;

  const MainButton(
      {super.key,
      required this.width,
      this.height = 44,
      required this.text,
      this.borderRadius = 15.0,
      this.isLoading = false,
      this.buttonColor = AppColors.kPrimaryColor,
      this.textColor = Colors.white,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            disabledForegroundColor: AppColors.kPrimaryColor.withOpacity(0.38),
            disabledBackgroundColor: AppColors.kPrimaryColor.withOpacity(0.12),
            backgroundColor: buttonColor,
            foregroundColor: textColor,
            textStyle: Styles.textStyle14W500.copyWith(fontFamily: 'DMSans'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            )),
        child: isLoading
            ? const SpinKitThreeInOut(
                color: Colors.white,
                size: 25,
              )
            : Text(text),
      ),
    );
  }
}
