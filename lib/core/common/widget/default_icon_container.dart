import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/theme/colors/color.dart';

class DefaultIconContainer extends StatelessWidget {
  const DefaultIconContainer({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 55.h,
          width: 55.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 32.sp,
          ),
        ),
        // horizontalSpace(22),
      ],
    );
  }
}
