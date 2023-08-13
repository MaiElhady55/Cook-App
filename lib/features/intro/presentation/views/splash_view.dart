import 'package:cook_app/core/functions/navigate.dart';
import 'package:cook_app/core/utils/app_colors.dart';
import 'package:cook_app/core/utils/app_images.dart';
import 'package:cook_app/features/intro/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),
        () => navigateTo(context: context, router: OnBoardingView()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            AppImages.logo,
            fit: BoxFit.cover,
          )),
          const SizedBox(
            height: 50,
          ),
          SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven
                      ? AppColors.kPrimaryColor
                      : AppColors.kPrimaryColor.withOpacity(0.6),
                ),
              );
            },
          )
          /*SpinKitSquareCircle(
            color: Color(0xffEF9F27),
            size: 50.0,
          )*/
        ],
      ),
    );
  }
}
