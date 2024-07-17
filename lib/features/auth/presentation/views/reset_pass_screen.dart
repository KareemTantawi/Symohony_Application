import 'package:flutter/material.dart';
import 'package:symphony_app/core/common/animation/animation_do.dart';
import 'package:symphony_app/core/common/widget/app_defailt_button.dart';
import 'package:symphony_app/core/common/widget/app_text_default_button.dart';
import 'package:symphony_app/core/common/widget/default_icon_container.dart';
import 'package:symphony_app/core/common/widget/defulat_text_form_feild.dart';
import 'package:symphony_app/core/theme/image/app_image.dart';
import 'package:symphony_app/core/utils/spacing.dart';
import 'package:symphony_app/features/auth/presentation/refactor/app_bar_method.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(
        context,
        'Reset Password',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            verticalSpace(50),
            CustomFadeInDown(
              duration: 600,
              child: Center(
                child: Image.asset(
                  AppImages.resetPassScreen,
                  height: 136,
                ),
              ),
            ),
            // verticalSpace(20),
            verticalSpace(50),
            CustomFadeInLeft(
              duration: 600,
              child: Row(
                children: [
                  const DefaultIconContainer(
                    icon: Icons.lock,
                  ),
                  horizontalSpace(22),
                  DefaultTextFormField(
                    textEditingController: TextEditingController(),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      return null;
                    },
                    onChanged: (value) {},
                    hintText: 'Password',
                  ),
                ],
              ),
            ),
            verticalSpace(16),
            CustomFadeInLeft(
              duration: 600,
              child: Row(
                children: [
                  const DefaultIconContainer(
                    icon: Icons.lock,
                  ),
                  horizontalSpace(22),
                  DefaultTextFormField(
                    textEditingController: TextEditingController(),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      return null;
                    },
                    onChanged: (value) {},
                    hintText: 'Re_Password',
                  ),
                ],
              ),
            ),
            verticalSpace(80),
            CustomFadeInRight(
              duration: 600,
              child: AppDefaultButton(
                onTap: () {
                  // context.pushName(Routes.resetPasswordScreen);
                },
                title: 'Reset',
              ),
            ),
            verticalSpace(10),
            AppDefaultTextButton(
              onPressed: () {},
              title: 'Cancel',
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
