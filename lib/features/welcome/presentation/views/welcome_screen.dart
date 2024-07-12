import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/common/animation/animation_do.dart';
import 'package:symphony_app/core/common/widget/app_defailt_button.dart';
import 'package:symphony_app/core/common/widget/app_text_default_button.dart';
import 'package:symphony_app/core/extension/extension.dart';
import 'package:symphony_app/core/routes/routes.dart';
import 'package:symphony_app/core/utils/spacing.dart';
import 'package:symphony_app/features/welcome/presentation/widgets/gradient_container.dart';
import 'package:symphony_app/features/welcome/presentation/widgets/secondry_Text.dart';
import 'package:symphony_app/features/welcome/presentation/widgets/welcome_image.dart';
import 'package:symphony_app/features/welcome/presentation/widgets/welcome_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const WelcomeImage(),
          const GradientContainer(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 220,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.w),
              child: Column(
                children: [
                  const CustomFadeInUp(
                    duration: 600,
                    child: WelcomeText(),
                  ),
                  verticalSpace(4),
                  const CustomFadeInUp(
                    duration: 600,
                    child: SecondryText(),
                  ),
                  verticalSpace(18),
                  CustomFadeInLeft(
                    duration: 600,
                    child: AppDefaultButton(
                      onTap: () {
                        context.pushName(Routes.loginScreen);
                      },
                      title: 'Login',
                    ),
                  ),
                  verticalSpace(8),
                  CustomFadeInRight(
                    duration: 500,
                    child: AppDefaultTextButton(
                      onPressed: () {
                        // context.pushName(AppRoutes.signupScreen);
                        context.pushName(Routes.registerScreen);
                      },
                      title: 'Sign up',
                    ),
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
