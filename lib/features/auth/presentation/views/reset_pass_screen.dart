import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symphony_app/core/common/animation/animation_do.dart';
import 'package:symphony_app/core/common/widget/app_defailt_button.dart';
import 'package:symphony_app/core/common/widget/app_text_default_button.dart';
import 'package:symphony_app/core/common/widget/default_icon_container.dart';
import 'package:symphony_app/core/common/widget/defulat_text_form_feild.dart';
import 'package:symphony_app/core/extension/extension.dart';
import 'package:symphony_app/core/routes/routes.dart';
import 'package:symphony_app/core/services/shared_pref/shared_pref.dart';
import 'package:symphony_app/core/theme/colors/color.dart';
import 'package:symphony_app/core/theme/image/app_image.dart';
import 'package:symphony_app/core/utils/spacing.dart';
import 'package:symphony_app/features/auth/presentation/manager/reset_pawword_cubit/reset_password_cubit.dart';
import 'package:symphony_app/features/auth/presentation/manager/reset_pawword_cubit/reset_password_state.dart';
import 'package:symphony_app/features/auth/presentation/refactor/app_bar_method.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _obscureText1 = true;

  void _toggleVisibility1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final resetPasswordCubit = BlocProvider.of<ResetPasswordCubit>(context);
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: AppColors.primaryColor,
              behavior: SnackBarBehavior.floating,
              content: const Text(
                'Go To The Email , and Click On The Link',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
          context.pushName(Routes.loginScreen);
          resetPasswordCubit.clearControllers();
        } else if (state is ResetPasswordFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: AppColors.primaryColor,
              behavior: SnackBarBehavior.floating,
              content: Text(
                state.errMessage,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: appBarMethod(
            context,
            'Reset Password',
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: resetPasswordCubit.resetPasswordFormKey,
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
                          // horizontalSpace(22),
                          const Spacer(),
                          DefaultTextFormField(
                            textEditingController:
                                resetPasswordCubit.newPasswordController,
                            obscureText: _obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            icon: _obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            onPressed: _toggleVisibility,
                            onChanged: (value) {},
                            hintText: 'New Password',
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
                          // horizontalSpace(22),
                          const Spacer(),
                          DefaultTextFormField(
                            textEditingController:
                                resetPasswordCubit.confirmNewPasswordController,
                            obscureText: _obscureText1,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            icon: _obscureText1
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            onPressed: _toggleVisibility1,
                            onChanged: (value) {},
                            hintText: 'Confirm New Password',
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(80),
                    CustomFadeInRight(
                      duration: 600,
                      child: state is ResetPasswordLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            )
                          : AppDefaultButton(
                              onTap: () {
                                if (resetPasswordCubit
                                    .resetPasswordFormKey.currentState!
                                    .validate()) {
                                  resetPasswordCubit.resetPassword();
                                }
                                print(
                                  "The Reset Token is: ${CacheHelper.sharedPreferences.getString('reset_token')}",
                                );
                              },
                              title: 'Reset',
                            ),
                    ),
                    verticalSpace(10),
                    AppDefaultTextButton(
                      onPressed: () {
                        context.pop();
                      },
                      title: 'Cancel',
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
