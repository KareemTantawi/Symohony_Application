import 'package:flutter/material.dart';
import 'package:symphony_app/core/extension/extension.dart';
import 'package:symphony_app/core/theme/colors/color.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';
import 'package:symphony_app/core/theme/font/font_weight_helper.dart';

AppBar appBarMethod(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryColor,
          size: 22,
        )),
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 15,
        fontWeight: FontWeightHelper.regular,
        fontFamily: FontFamilyHelper.fontFamily1,
      ),
    ),
  );
}
