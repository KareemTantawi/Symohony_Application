import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';
import 'package:symphony_app/core/theme/image/app_image.dart';

class HomeCard extends StatelessWidget {
  HomeCard({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });
  final String image;
  final String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 220.h,
        width: 150.w,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Image.asset(
              image,
              fit: BoxFit.fill,
              height: 220.h,
            ),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: FontFamilyHelper.fontFamily2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
