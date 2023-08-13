import 'package:cook_app/core/app_widgets/main_button.dart';
import 'package:cook_app/core/functions/navigate.dart';
import 'package:cook_app/core/utils/app_images.dart';
import 'package:cook_app/core/utils/size_config.dart';
import 'package:cook_app/features/auth/presentation/views/login_view.dart';
import 'package:cook_app/features/intro/domain/entities/onboarding.dart';
import 'package:cook_app/features/intro/presentation/widgets/onboarding_item.dart';
import 'package:cook_app/features/intro/presentation/widgets/smooth_boarding_indicator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});

  List<OnBoarding> boarding = const [
    OnBoarding(
        image: AppImages.board1,
        title: 'Diverse & sparkling food',
        description:
            'We use the best local ingredients to create fresh and delicious food and drinks.'),
    OnBoarding(
        image: AppImages.board2,
        title: 'Free shipping on all orders',
        description:
            'Free shipping on the primary order whilst the usage of CaPay fee method.'),
    OnBoarding(
        image: AppImages.board3,
        title: '+24K Restaurants',
        description:
            'Easily find your favorite food and have it delivered in record time.'),
  ];

  final boardController = PageController();

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.width(context);
    var height = SizeConfig.height(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              itemCount: boarding.length,
              physics: const BouncingScrollPhysics(),
              controller: boardController,
              itemBuilder: (context, index) {
                return OnBoradingItem(boarding: boarding[index]);
              },
            ),
          ),
          SizedBox(
            height: height * 0.010,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: SizeConfig.paddingH(context),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmoothBoardingIndicator(boardController: boardController),
                    ],
                  ),
                  SizedBox(height: height * 0.094),
                  MainButton(
                      text: 'Get started',
                      width: width,
                      function: () {
                        navigateAndFinsh(context: context, router: LoginView());
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
