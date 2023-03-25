import 'package:bloc_task/config/color_constants.dart';
import 'package:flutter/material.dart';

import '../../config/text_style.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: const Row(children: <Widget>[
        Expanded(
          child: Divider(
            color: ColorConstants.lightGray,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Or continue with",
            style: CustomTextStyle.thinText,
          ),
        ),
        Expanded(
            child: Divider(
          color: ColorConstants.lightGray,
        )),
      ]),
    );
  }
}
