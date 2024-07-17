import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/extension/extension.dart';
import 'package:symphony_app/core/routes/routes.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';
import 'package:symphony_app/core/theme/image/app_image.dart';

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
              vertical: 3.h,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Opinion',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: FontFamilyHelper.fontFamily1,
                    ),
                  ),
                  verticalSpace(4),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeCard(
                        onTap: () {
                          context.pushName(Routes.speechToTextScreen);
                        },
                        image: AppImages.card1,
                        title: 'Speech to Text',
                      ),
                      HomeCard(
                        onTap: () {},
                        image: AppImages.card2,
                        title: 'Text To Sign Language',
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeCard(
                        onTap: () {},
                        image: AppImages.card3,
                        title: 'Sign Language Text To',
                      ),
                      HomeCard(
                        onTap: () {},
                        image: AppImages.card4,
                        title: 'Learn Sign Language',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
