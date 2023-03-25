import 'package:flutter/material.dart';
import 'color_constants.dart';

class CustomTextStyle {
  static const TextStyle thinText = TextStyle(
    fontSize: 12,
    color: ColorConstants.lightGray,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle boldText =
      TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold);
}
