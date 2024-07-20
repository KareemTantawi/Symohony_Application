import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:symphony_app/core/routes/app_router.dart';
import 'package:symphony_app/core/services/shared_pref/shared_pref.dart';
import 'package:symphony_app/symphony_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  //! Setting preferred device orientations to portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then(
    (_) => runApp(
      SymphonyApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}
