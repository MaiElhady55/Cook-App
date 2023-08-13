import 'package:cook_app/core/utils/size_config.dart';
import 'package:cook_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final void Function() fun;
  final String text;
  final Color color;
  final String imageIcon;

  const SocialButton(
      {super.key,
      required this.fun,
      required this.text,
      required this.color,
      required this.imageIcon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: SizeConfig.width(context),
        height: 48,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(text, style: Styles.textStyle14W500),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Image.asset(
                    imageIcon,
                    fit: BoxFit.cover,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
