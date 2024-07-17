import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/common/widget/app_defailt_button.dart';
import 'package:symphony_app/core/common/widget/app_text_default_button.dart';
import 'package:symphony_app/core/common/widget/default_icon_container.dart';
import 'package:symphony_app/core/common/widget/default_show_dialog_app.dart';
import 'package:symphony_app/core/common/widget/defulat_text_form_feild.dart';
import 'package:symphony_app/core/extension/extension.dart';
import 'package:symphony_app/core/routes/routes.dart';
import 'package:symphony_app/core/utils/spacing.dart';
import 'package:symphony_app/features/auth/presentation/widgets/image_container_login.dart';
import 'package:symphony_app/features/auth/presentation/widgets/login_text_widget.dart';

import '../../../../core/common/animation/animation_do.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageContainer(),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 26.w,
                  vertical: 12.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomFadeInLeft(
                      duration: 600,
                      child: LoginTextWidget(),
                    ),
                    verticalSpace(26),
                    CustomFadeInRight(
                      duration: 600,
                      child: Row(
                        children: [
                          const DefaultIconContainer(
                            icon: Icons.email_rounded,
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
                    verticalSpace(22),
                    CustomFadeInLeft(
                      duration: 600,
                      child: Row(
                        children: [
                          const DefaultIconContainer(
                            icon: Icons.lock,
                          ),
                          horizontalSpace(22),
                          DefaultTextFormField(
                            textEditingController: _passController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              return null;
                            },
                            onChanged: (value) {},
                            hintText: '.............',
                          ),
                        ],
                      ),
                    ),
                    // verticalSpace(8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomFadeInRight(
                        duration: 600,
                        child: AppDefaultTextButton(
                          onPressed: () {
                            context.pushName(Routes.forgetPassScreen);
                          },
                          title: 'Forget Password?',
                          size: 14,
                        ),
                      ),
                    ),
                    verticalSpace(10),
                    CustomFadeInRight(
                      duration: 600,
                      child: AppDefaultButton(
                        onTap: () {
                          defaultShowDialogApp(context);
                          context.pushAndRemoveUntil(Routes.homeScreen);
                        },
                        title: 'Login',
                      ),
                    ),
                    Center(
                      child: AppDefaultTextButton(
                        onPressed: () {
                          // context.pushName(AppRoutes.signupScreen);
                          context.pushReplacementNamed(Routes.registerScreen);
                        },
                        title: "Don't  have  an account ?",
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
