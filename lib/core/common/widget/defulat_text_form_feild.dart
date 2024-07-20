import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/theme/colors/color.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField({
    super.key,
    required this.textEditingController,
    required this.keyboardType,
    required this.validator,
    required this.onChanged,
    required this.hintText,
    this.obscureText = false,
    this.icon,
    this.onPressed,
  });
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String hintText;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 255.w,
      height: 54.h,
      child: TextFormField(
        controller: textEditingController,
        cursorRadius: const Radius.circular(12),
        cursorWidth: 2.w,
        cursorHeight: 22.h,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        cursorColor: AppColors.primaryColor,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 18.sp,
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: AppColors.primaryColor,
          ),
          filled: true,
          fillColor: AppColors.fillTextFieldColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 13.h,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.4),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
