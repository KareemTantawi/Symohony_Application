import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:symphony_app/core/theme/colors/color.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';
import 'package:symphony_app/core/theme/font/font_weight_helper.dart';

class LoginTextWidget extends StatelessWidget {
  const LoginTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Login',
      style: TextStyle(
        fontSize: 32.sp,
        fontFamily: FontFamilyHelper.fontFamily1,
        color: AppColors.primaryColor,
        fontWeight: FontWeightHelper.semiBold,
      ),
    );
  }
}
