import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/theme/colors/color.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome To Symphony ',
      style: TextStyle(
        fontSize: 20.sp,
        fontFamily: FontFamilyHelper.fontFamily1,
        color: AppColors.primaryColor,
      ),
    );
  }
}
