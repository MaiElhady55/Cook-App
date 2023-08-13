import 'package:flutter/material.dart';

class SizeConfig {
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

//28
  static EdgeInsets paddingH(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: width(context) * 0.077);
}
