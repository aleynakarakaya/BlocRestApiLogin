import 'package:flutter/material.dart';

import '../../config/color_constants.dart';

class SocialRowWidget extends StatelessWidget {
  const SocialRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Google'),
            const AssetImage(
              'assets/google.png',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Apple'),
            const AssetImage(
              'assets/apple.png',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Facebook'),
            const AssetImage(
              'assets/facebook.png',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: null,
      child: Container(
        height: 50.0,
        width: 65.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(17.0),
          ),
          border: Border.all(color: ColorConstants.lightGray),
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }
}
