import 'package:flutter/material.dart';
import 'package:symphony_app/core/theme/image/app_image.dart';
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
      body: Column(
        children: [
          Image.asset(
            AppImages.forgetPassScreen,
          ),
        ],
      ),
    );
  }
}
