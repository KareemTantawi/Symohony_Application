import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';
import 'package:symphony_app/core/theme/image/app_image.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 150.w,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Image.asset(
            AppImages.card1,
            fit: BoxFit.fill,
            height: 220.h,
          ),
          Center(
            child: Text(
              'Speech to Text',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.sp,
                fontFamily: FontFamilyHelper.fontFamily2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
