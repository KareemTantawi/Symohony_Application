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
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36.r),
          bottomRight: Radius.circular(36.r),
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
                    const Spacer(),
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
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      Container(
                        width: 160,
                        // color: Colors.red,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.homeManPhoto),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
