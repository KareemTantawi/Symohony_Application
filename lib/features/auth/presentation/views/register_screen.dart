import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/common/animation/animation_do.dart';
import 'package:symphony_app/core/common/widget/app_defailt_button.dart';
import 'package:symphony_app/core/common/widget/app_text_default_button.dart';
import 'package:symphony_app/core/common/widget/default_icon_container.dart';
import 'package:symphony_app/core/common/widget/defulat_text_form_feild.dart';
import 'package:symphony_app/core/extension/extension.dart';
import 'package:symphony_app/core/routes/routes.dart';
import 'package:symphony_app/core/theme/colors/color.dart';
import 'package:symphony_app/core/utils/app_regex.dart';
import 'package:symphony_app/core/utils/spacing.dart';
import 'package:symphony_app/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:symphony_app/features/auth/presentation/manager/register_cubit/register_state.dart';
import 'package:symphony_app/features/auth/presentation/widgets/text_and_image_logo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    final registerCubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: AppColors.primaryColor,
              behavior: SnackBarBehavior.floating,
              content: const Text(
                'Success Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
          Navigator.pushReplacementNamed(context, Routes.loginScreen);
          registerCubit.clearControllers();
        } else if (state is RegisterFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: AppColors.primaryColor,
              behavior: SnackBarBehavior.floating,
              content: Text(
                state.errMessage ?? '',
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
          body: SingleChildScrollView(
            child: Form(
              key: registerCubit.registerFormKey,
              child: Column(
                children: [
                  verticalSpace(30),
                  const TextAndImageLogo(),
                  // verticalSpace(15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      children: [
                        CustomFadeInLeft(
                          duration: 600,
                          child: Row(
                            children: [
                              const DefaultIconContainer(
                                icon: Icons.person,
                              ),
                              // horizontalSpace(22),
                              const Spacer(),
                              DefaultTextFormField(
                                textEditingController:
                                    registerCubit.userNameController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter user name';
                                  }
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
                              // horizontalSpace(22),
                              const Spacer(),
                              DefaultTextFormField(
                                textEditingController:
                                    registerCubit.emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Your Name';
                                  }
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
                              // horizontalSpace(22),
                              const Spacer(),
                              DefaultTextFormField(
                                textEditingController:
                                    registerCubit.phoneController,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Your Phone Number';
                                  }
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
                              // horizontalSpace(22),
                              const Spacer(),
                              DefaultTextFormField(
                                textEditingController:
                                    registerCubit.passwordController,
                                obscureText: _obscureText,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (!AppRegex.isPasswordValid(value)) {
                                    return 'Password must be at least 8 characters long,\ninclude an uppercase letter,a lowercase letter,\na number, and a special character.';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                                icon: _obscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                onPressed: _toggleVisibility,
                                hintText: 'Password',
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
                              // horizontalSpace(22),
                              const Spacer(),
                              DefaultTextFormField(
                                textEditingController:
                                    registerCubit.confirmPasswordController,
                                obscureText: _obscureText1,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (!AppRegex.isPasswordValid(value)) {
                                    return 'Password must be at least 8 characters long,\ninclude an uppercase letter,a lowercase letter,\na number, and a special character.';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                                icon: _obscureText1
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                onPressed: _toggleVisibility1,
                                hintText: 'Confirm Password',
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(26),
                        CustomFadeInDown(
                          duration: 600,
                          child: state is RegisterLoadingState
                              ? const CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                )
                              : AppDefaultButton(
                                  onTap: () {
                                    if (registerCubit
                                        .registerFormKey.currentState!
                                        .validate()) {
                                      registerCubit.register();
                                    }
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
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
          ),
        );
      },
    );
  }
}
