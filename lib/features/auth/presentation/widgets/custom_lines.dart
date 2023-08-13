import 'package:cook_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomLines extends StatelessWidget {
  const CustomLines({super.key});

  Widget buildContainer() {
    return Container(
      height: 2,
      width: 125,
      decoration: BoxDecoration(
          color: const Color(0xffF4F5F7),
          borderRadius: BorderRadius.circular(0.5)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildContainer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'OR',
            style: Styles.textStyle14,
          ),
        ),
        buildContainer()
      ],
    );
  }
}
