import 'package:flutter/material.dart';
import 'package:symphony_app/core/theme/colors/color.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome To Symphony ',
      style: TextStyle(
        fontSize: 18,
        fontFamily: FontFamilyHelper.fontFamily1,
        color: AppColors.primaryColor,
      ),
    );
  }
}
