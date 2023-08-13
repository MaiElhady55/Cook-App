import 'package:cook_app/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothBoardingIndicator extends StatelessWidget {
  final PageController boardController;

  const SmoothBoardingIndicator({super.key, required this.boardController});
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: boardController,
      count: 3,
      axisDirection: Axis.horizontal,
      effect: const ExpandingDotsEffect(
        activeDotColor: AppColors.kPrimaryColor,
        dotColor: Color(0xffEBECF0),
        dotHeight: 6,
        dotWidth: 12,
        spacing: 8,
      ),
    );
  }
}
