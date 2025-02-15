import 'package:symphony_app/features/auth/presentation/views/forget_pass_screen.dart';
import 'package:symphony_app/features/auth/presentation/views/login_screen.dart';
import 'package:symphony_app/features/auth/presentation/views/register_screen.dart';
import 'package:symphony_app/features/auth/presentation/views/reset_pass_screen.dart';
import 'package:symphony_app/features/home/presentation/views/home_screen.dart';
import 'package:symphony_app/features/learn_language/presentation/views/learn_language.dart';
import 'package:symphony_app/features/speech_to_text/presentation/views/speech_to_text_screen.dart';
import 'package:symphony_app/features/welcome/presentation/views/welcome_screen.dart';

import './routes.dart';

import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.forgetPassScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPassScreen(),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ResetPassScreen(),
        );
      case Routes.speechToTextScreen:
        return MaterialPageRoute(
          builder: (_) => const SpeechToTextScreen(),
        );
      case Routes.learnLanguage:
        return MaterialPageRoute(
          builder: (_) => const LearnLanguage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No Routes defiend for ${setting.name}',
              ),
            ),
          ),
        );
    }
  }
}
