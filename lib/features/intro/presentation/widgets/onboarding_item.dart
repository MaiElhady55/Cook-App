import 'package:cook_app/core/utils/size_config.dart';
import 'package:cook_app/core/utils/styles.dart';
import 'package:cook_app/features/intro/domain/entities/onboarding.dart';
import 'package:flutter/material.dart';

class OnBoradingItem extends StatelessWidget {
  final OnBoarding boarding;

  const OnBoradingItem({super.key, required this.boarding});
  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.width(context);
    var height = SizeConfig.height(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height * 0.36,
          // 270,
          width: width,
          // 305,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(boarding.image))),
        ),
        SizedBox(
          height: height * 0.11,
          //80,
        ),
        Text(boarding.title, style: Styles.textStyle24),
        SizedBox(
          height: height * 0.016,
          // 12,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.040),
          child: Text(boarding.description,
              textAlign: TextAlign.center,
              style: Styles.textStyle14.copyWith(height: 1.7)),
        ),
      ],
    );
  }
}
