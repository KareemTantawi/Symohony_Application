import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/theme/colors/color.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';
import 'package:symphony_app/core/theme/font/font_weight_helper.dart';
import 'package:symphony_app/core/theme/image/app_image.dart';

class TextAndImageLogo extends StatelessWidget {
  const TextAndImageLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 26.w),
          child: Text(
            'Create \nAccount',
            style: TextStyle(
              letterSpacing: 2,
              color: AppColors.primaryColor,
              fontSize: 34.sp,
              fontWeight: FontWeightHelper.semiBold,
              fontFamily: FontFamilyHelper.fontFamily1,
            ),
          ),
        ),
        Expanded(
          child: Image.asset(
            AppImages.signupLogo,
            height: 260.h,
            width: 200.w,
          ),
        ),
      ],
    );
  }
}
