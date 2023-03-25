import 'package:bloc_task/pages/widgets/button_widget.dart';
import 'package:bloc_task/pages/widgets/divider_widget.dart';
import 'package:bloc_task/pages/widgets/social_row_widget.dart';
import 'package:bloc_task/pages/widgets/user_input_widget.dart';
import 'package:flutter/material.dart';
import '../../config/text_style.dart';

class LoginUiWidget extends StatelessWidget {
  LoginUiWidget({super.key});

  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Image(
              image: AssetImage("assets/background.jpeg"),
              fit: BoxFit.cover,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.33),
                  const Text(
                    "Hello Again!",
                    style: CustomTextStyle.boldText,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Welcome back you've been missed!",
                      style: CustomTextStyle.thinText,
                    ),
                  ),
                  const UserInputWidget(),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 200),
                    child: Text(
                      "Recovery password",
                      style: CustomTextStyle.thinText,
                    ),
                  ),
                  ButtonWidget(formKey: _formKey),
                  const DividerWidget(),
                  const SocialRowWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
