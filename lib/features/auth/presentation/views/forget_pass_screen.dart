import 'package:flutter/material.dart';
import 'package:symphony_app/core/common/animation/animation_do.dart';
import 'package:symphony_app/core/common/widget/app_defailt_button.dart';
import 'package:symphony_app/core/common/widget/app_text_default_button.dart';
import 'package:symphony_app/core/common/widget/default_icon_container.dart';
import 'package:symphony_app/core/common/widget/defulat_text_form_feild.dart';
import 'package:symphony_app/core/extension/extension.dart';
import 'package:symphony_app/core/routes/routes.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';
import 'package:symphony_app/core/theme/font/font_weight_helper.dart';
import 'package:symphony_app/core/theme/image/app_image.dart';
import 'package:symphony_app/core/utils/spacing.dart';
import 'package:symphony_app/features/auth/presentation/refactor/app_bar_method.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(
        context,
        'Forget Password',
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
                  AppImages.forgetPassScreen,
                  height: 136,
                ),
              ),
            ),
            verticalSpace(20),
            const CustomFadeInLeft(
              duration: 600,
              child: Text(
                textAlign: TextAlign.center,
                'A password verification will be sent to your email. You should follow up on At',
                style: TextStyle(
                  color: Color(0xff878787),
                  fontSize: 15,
                  fontWeight: FontWeightHelper.regular,
                  fontFamily: FontFamilyHelper.fontFamily1,
                ),
              ),
            ),
            verticalSpace(30),
            CustomFadeInRight(
              duration: 600,
              child: Row(
                children: [
                  const DefaultIconContainer(
                    icon: Icons.email_rounded,
                  ),
                  horizontalSpace(20),
                  DefaultTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      return null;
                    },
                    onChanged: (value) {},
                    hintText: 'Enter your email',
                    textEditingController: TextEditingController(),
                  ),
                ],
              ),
            ),
            verticalSpace(80),
            CustomFadeInRight(
              duration: 600,
              child: AppDefaultButton(
                onTap: () {
                  context.pushReplacementNamed(Routes.resetPasswordScreen);
                },
                title: 'Send',
              ),
            ),
            verticalSpace(10),
            AppDefaultTextButton(
              onPressed: () {},
              title: 'Back to Login',
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
