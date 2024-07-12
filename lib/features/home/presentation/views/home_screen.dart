import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';

import 'package:symphony_app/core/utils/spacing.dart';
import 'package:symphony_app/features/home/presentation/widgets/home_card.dart';
import 'package:symphony_app/features/home/presentation/widgets/home_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeContainer(),
          // verticalSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 26.w,
              vertical: 6.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Opinion',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: FontFamilyHelper.fontFamily1,
                  ),
                ),
                verticalSpace(20),
                // GridView.builder(
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemCount: 4,
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       crossAxisSpacing: 20.w,
                //       mainAxisSpacing: 20.h,
                //     ),
                //     itemBuilder: (context, index) {
                //       return const HomeCard();
                //     }),
                const HomeCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
