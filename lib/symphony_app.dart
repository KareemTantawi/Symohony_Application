import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/routes/app_router.dart';
import 'package:symphony_app/core/routes/routes.dart';

class SymphonyApp extends StatelessWidget {
  const SymphonyApp({
    super.key,
    required this.appRouter,
  });
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.welcomeScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
