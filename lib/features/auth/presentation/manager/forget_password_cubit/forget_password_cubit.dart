import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symphony_app/core/services/network/api/api_endpoints.dart';
import 'package:symphony_app/core/services/network/api/dio_consumer.dart';
import 'package:symphony_app/features/auth/data/models/forget_password_model.dart';
import 'package:symphony_app/features/auth/presentation/manager/forget_password_cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.api) : super(ForgetPasswordInitialState());
  DioConsumer api;
  ForgetPasswordModel? forgetPasswordModel;

  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  void clearControllers() {
    emailController.clear();
  }

  Future<void> forgetPassword() async {
    try {
      emit(ForgetPasswordLoadingState());
      final response = await api.post(
        EndPoints.forgetPassword,
        data: {
          "email": emailController.text,
        },
      );
      if (response != null && response is Map<String, dynamic>) {
        forgetPasswordModel = ForgetPasswordModel.fromJson(response);

        emit(ForgetPasswordSuccessState());
      } else {
        emit(
          ForgetPasswordFailureState(
              errMessage: 'Invalid response from the server'),
        );
      }
    } on Exception catch (e) {
      emit(ForgetPasswordFailureState(errMessage: e.toString()));
    }
  }
}
