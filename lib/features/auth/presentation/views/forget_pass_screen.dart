import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symphony_app/core/common/animation/animation_do.dart';
import 'package:symphony_app/core/common/widget/app_defailt_button.dart';
import 'package:symphony_app/core/common/widget/app_text_default_button.dart';
import 'package:symphony_app/core/common/widget/default_icon_container.dart';
import 'package:symphony_app/core/common/widget/defulat_text_form_feild.dart';
import 'package:symphony_app/core/extension/extension.dart';
import 'package:symphony_app/core/routes/routes.dart';
import 'package:symphony_app/core/theme/colors/color.dart';
import 'package:symphony_app/core/theme/font/font_family_helper.dart';
import 'package:symphony_app/core/theme/font/font_weight_helper.dart';
import 'package:symphony_app/core/theme/image/app_image.dart';
import 'package:symphony_app/core/utils/spacing.dart';
import 'package:symphony_app/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:symphony_app/features/auth/presentation/manager/forget_password_cubit/forget_password_state.dart';
import 'package:symphony_app/features/auth/presentation/refactor/app_bar_method.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPasswordCubit = BlocProvider.of<ForgetPasswordCubit>(context);
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: AppColors.primaryColor,
              behavior: SnackBarBehavior.floating,
              content: const Text(
                'Success verification',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
          context.pushAndRemoveUntil(Routes.resetPasswordScreen);
          forgetPasswordCubit.clearControllers();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarMethod(
            context,
            'Forget Password',
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: forgetPasswordCubit.forgetPasswordFormKey,
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
                    verticalSpace(60),
                    CustomFadeInRight(
                      duration: 600,
                      child: Row(
                        children: [
                          const DefaultIconContainer(
                            icon: Icons.email_rounded,
                          ),
                          // horizontalSpace(20),
                          const Spacer(),
                          DefaultTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                            hintText: 'Enter your email',
                            textEditingController:
                                forgetPasswordCubit.emailController,
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(20),
                    CustomFadeInRight(
                      duration: 600,
                      child: state is ForgetPasswordLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            )
                          : AppDefaultButton(
                              onTap: () {
                                if (forgetPasswordCubit
                                    .forgetPasswordFormKey.currentState!
                                    .validate()) {
                                  forgetPasswordCubit.forgetPassword();
                                }
                              },
                              title: 'Send',
                            ),
                    ),
                    verticalSpace(10),
                    AppDefaultTextButton(
                      onPressed: () {
                        context.pushReplacementNamed(Routes.loginScreen);
                      },
                      title: 'Back to Login',
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
