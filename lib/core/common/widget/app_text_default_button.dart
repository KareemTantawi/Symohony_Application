import 'package:flutter/material.dart';
import 'package:symphony_app/core/theme/colors/color.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';

class AppDefaultTextButton extends StatelessWidget {
  const AppDefaultTextButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.size = 24,
  });
  final void Function()? onPressed;
  final String title;
  final double size;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.primaryColor.withOpacity(0.7),
          fontSize: size,
          fontFamily: FontFamilyHelper.fontFamily1,
        ),
      ),
    );
  }
}
