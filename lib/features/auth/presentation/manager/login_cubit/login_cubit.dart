import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symphony_app/core/services/network/api/api_endpoints.dart';
import 'package:symphony_app/core/services/network/api/dio_consumer.dart';
import 'package:symphony_app/features/auth/data/models/login_model.dart';
import 'package:symphony_app/features/auth/presentation/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginInitialState());
  DioConsumer api;
  LoginModel? loginModel;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> login() async {
    try {
      emit(LoginLoadingState());
      final response = await api.post(
        EndPoints.login,
        data: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
      if (response != null && response is Map<String, dynamic>) {
        loginModel = LoginModel.fromJson(response);

        emit(LoginSuccessState());
      } else {
        emit(
          LoginFailureState(errMessage: 'Invalid response from the server'),
        );
      }
    } on Exception catch (e) {
      emit(LoginFailureState(errMessage: e.toString()));
    }
  }
}
