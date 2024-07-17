import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/common/animation/animation_do.dart';
import 'package:symphony_app/core/common/widget/app_defailt_button.dart';
import 'package:symphony_app/core/common/widget/app_text_default_button.dart';
import 'package:symphony_app/core/common/widget/default_icon_container.dart';
import 'package:symphony_app/core/common/widget/defulat_text_form_feild.dart';
import 'package:symphony_app/core/extension/extension.dart';
import 'package:symphony_app/core/routes/routes.dart';
import 'package:symphony_app/core/utils/spacing.dart';
import 'package:symphony_app/features/auth/presentation/widgets/text_and_image_logo.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(30),
            const TextAndImageLogo(),
            // verticalSpace(15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: Column(
                children: [
                  CustomFadeInLeft(
                    duration: 600,
                    child: Row(
                      children: [
                        const DefaultIconContainer(
                          icon: Icons.person,
                        ),
                        horizontalSpace(22),
                        DefaultTextFormField(
                          textEditingController: _userController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            return null;
                          },
                          onChanged: (value) {},
                          hintText: 'user name',
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(26),
                  CustomFadeInRight(
                    duration: 600,
                    child: Row(
                      children: [
                        const DefaultIconContainer(
                          icon: Icons.email,
                        ),
                        horizontalSpace(22),
                        DefaultTextFormField(
                          textEditingController: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            return null;
                          },
                          onChanged: (value) {},
                          hintText: 'kareem@gmail.com',
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(26),
                  CustomFadeInLeft(
                    duration: 600,
                    child: Row(
                      children: [
                        const DefaultIconContainer(
                          icon: Icons.phone,
                        ),
                        horizontalSpace(22),
                        DefaultTextFormField(
                          textEditingController: _phoneController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            return null;
                          },
                          onChanged: (value) {},
                          hintText: '+2012298656',
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(26),
                  CustomFadeInRight(
                    duration: 600,
                    child: Row(
                      children: [
                        const DefaultIconContainer(
                          icon: Icons.lock,
                        ),
                        horizontalSpace(22),
                        DefaultTextFormField(
                          textEditingController: _passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            return null;
                          },
                          onChanged: (value) {},
                          hintText: '...........',
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(26),
                  CustomFadeInLeft(
                    duration: 600,
                    child: Row(
                      children: [
                        const DefaultIconContainer(
                          icon: Icons.lock,
                        ),
                        horizontalSpace(22),
                        DefaultTextFormField(
                          textEditingController: _passwordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            return null;
                          },
                          onChanged: (value) {},
                          hintText: '............',
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(26),
                  CustomFadeInDown(
                    duration: 600,
                    child: AppDefaultButton(
                      onTap: () {
                        context.pushAndRemoveUntil(Routes.homeScreen);
                      },
                      title: 'Sign Up',
                    ),
                  ),
                  AppDefaultTextButton(
                    size: 14,
                    onPressed: () {
                      context.pushReplacementNamed(Routes.loginScreen);
                    },
                    title: 'ِAlready have  an account ?',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
