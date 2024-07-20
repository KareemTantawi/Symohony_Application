import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:symphony_app/core/routes/app_router.dart';
import 'package:symphony_app/core/routes/routes.dart';
import 'package:symphony_app/core/services/network/api/dio_consumer.dart';
import 'package:symphony_app/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:symphony_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:symphony_app/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:symphony_app/features/auth/presentation/manager/reset_pawword_cubit/reset_password_cubit.dart';

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
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider<ForgetPasswordCubit>(
          create: (context) => ForgetPasswordCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider<ResetPasswordCubit>(
          create: (context) => ResetPasswordCubit(DioConsumer(dio: Dio())),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        child: MaterialApp(
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.welcomeScreen,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
