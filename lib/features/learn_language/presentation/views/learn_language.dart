import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/extension/extension.dart';
import 'package:symphony_app/core/theme/colors/color.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';
import 'package:symphony_app/core/theme/font/font_weight_helper.dart';
import 'package:symphony_app/core/theme/image/app_image.dart';
import 'package:symphony_app/core/utils/spacing.dart';

class LearnLanguage extends StatelessWidget {
  const LearnLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryColor,
          size: 26,
        ),
        title: const Text(
          'Learn Sign Language',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: FontFamilyHelper.fontFamily1,
            fontSize: 15,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppImages.welcomeCourse,
              height: context.height * 0.28,
              width: double.infinity,
            ),
            verticalSpace(4),
            const Text(
              'Training centers for Learn Sign Language',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff878787),
                fontFamily: FontFamilyHelper.fontFamily1,
                fontSize: 15,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
