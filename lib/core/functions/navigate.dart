import 'package:flutter/material.dart';

void navigateTo({required context, required router}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => router));

Future navigateAndFinsh(
        {required BuildContext context, required Widget router}) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => router),
        (Route<dynamic> route) => false);
