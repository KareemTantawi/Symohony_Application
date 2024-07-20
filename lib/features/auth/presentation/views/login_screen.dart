import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/common/widget/app_defailt_button.dart';
import 'package:symphony_app/core/common/widget/app_text_default_button.dart';
import 'package:symphony_app/core/common/widget/default_icon_container.dart';
import 'package:symphony_app/core/common/widget/default_show_dialog_app.dart';
import 'package:symphony_app/core/common/widget/defulat_text_form_feild.dart';
import 'package:symphony_app/core/extension/extension.dart';
import 'package:symphony_app/core/routes/routes.dart';
import 'package:symphony_app/core/theme/colors/color.dart';
import 'package:symphony_app/core/utils/spacing.dart';
import 'package:symphony_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:symphony_app/features/auth/presentation/manager/login_cubit/login_state.dart';
import 'package:symphony_app/features/auth/presentation/widgets/image_container_login.dart';
import 'package:symphony_app/features/auth/presentation/widgets/login_text_widget.dart';

import '../../../../core/common/animation/animation_do.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: AppColors.primaryColor,
              behavior: SnackBarBehavior.floating,
              content: const Text(
                'Logged in successfully , Welcome to our Application',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
          // defaultShowDialogApp(context);
          context.pushAndRemoveUntil(Routes.homeScreen);
        } else if (state is LoginFailureState) {
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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: loginCubit.loginFormKey,
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
                                  textEditingController:
                                      loginCubit.emailController,
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
                                  textEditingController:
                                      loginCubit.passwordController,
                                  obscureText: _obscureText,
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    return null;
                                  },
                                  icon: _obscureText
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  onPressed: _toggleVisibility,
                                  onChanged: (value) {},
                                  hintText: 'Password',
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
                            child: state is LoginLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primaryColor,
                                    ),
                                  )
                                : AppDefaultButton(
                                    onTap: () {
                                      // defaultShowDialogApp(context);
                                      if (loginCubit.loginFormKey.currentState!
                                          .validate()) {
                                        loginCubit.login();
                                      }
                                      // context.pushName(AppRoutes.homeScreen);
                                    },
                                    title: 'Login',
                                  ),
                          ),
                          Center(
                            child: AppDefaultTextButton(
                              onPressed: () {
                                // context.pushName(AppRoutes.signupScreen);
                                context.pushReplacementNamed(
                                    Routes.registerScreen);
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
          ),
        );
      },
    );
  }
}
