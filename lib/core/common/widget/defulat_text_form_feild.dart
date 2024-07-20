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
      width: 254.w,
      height: 54.h,
      child: TextFormField(
        controller: textEditingController,
        cursorRadius: Radius.circular(12.r),
        cursorWidth: 2,
        cursorHeight: 22,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        cursorColor: AppColors.primaryColor,
        style: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 18,
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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 13,
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
