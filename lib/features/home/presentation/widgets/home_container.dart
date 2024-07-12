import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/extension/extension.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';
import 'package:symphony_app/core/theme/font/font_weight_helper.dart';
import 'package:symphony_app/core/theme/image/app_image.dart';

import 'package:symphony_app/core/utils/spacing.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: context.height * .4,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Stack(
        children: [
          Image.asset(
            AppImages.rectangleHomePage,
            fit: BoxFit.fill,
            height: context.height * .4,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        AppImages.menuIcon,
                        height: 45.h,
                        width: 45.w,
                      ),
                    ),
                    horizontalSpace(200),
                    Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 39.sp,
                    ),
                    horizontalSpace(10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppImages.img1,
                        height: 58.h,
                        width: 58.w,
                      ),
                    ),
                  ],
                ),
                verticalSpace(20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeightHelper.semiBold,
                              color: Colors.white,
                              fontFamily: FontFamilyHelper.fontFamily1,
                            ),
                          ),
                          verticalSpace(6),
                          Text(
                            'EmailExample@gmail.com',
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeightHelper.semiBold,
                              color: Colors.white.withOpacity(0.7),
                              fontFamily: FontFamilyHelper.fontFamily1,
                            ),
                          ),
                          verticalSpace(15),
                          Image.asset(
                            AppImages.appLogo,
                            height: 80.h,
                            width: 138.w,
                          ),
                        ],
                      ),
                    ),
                    // Image.asset(
                    //   AppImages.homeManPhoto,
                    //   height: 180.h,
                    //   width: 180.w,
                    // ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
