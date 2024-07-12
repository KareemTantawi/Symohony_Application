import 'package:flutter/material.dart';
import 'package:symphony_app/core/theme/image/app_image.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.welcomeImage,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
