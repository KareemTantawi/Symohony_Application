import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/routes/app_router.dart';
import 'package:symphony_app/core/routes/routes.dart';
import 'package:symphony_app/core/services/network/api/dio_consumer.dart';
import 'package:symphony_app/features/auth/presentation/manager/register_cubit/register_cubit.dart';

class SymphonyApp extends StatelessWidget {
  const SymphonyApp({
    super.key,
    required this.appRouter,
  });
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(DioConsumer(dio: Dio())),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.welcomeScreen,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
