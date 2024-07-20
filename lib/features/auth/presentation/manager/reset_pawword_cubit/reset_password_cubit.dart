import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symphony_app/core/services/network/api/api_endpoints.dart';
import 'package:symphony_app/core/services/network/api/dio_consumer.dart';
import 'package:symphony_app/core/services/shared_pref/shared_pref.dart';
import 'package:symphony_app/features/auth/data/models/reset_password_mode.dart';
import 'package:symphony_app/features/auth/presentation/manager/reset_pawword_cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.dio) : super(ResetPasswordInitialState());
  DioConsumer dio;
  ResetPasswordModel? resetPasswordModel;

  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  void dispose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
  }

  void clearControllers() {
    newPasswordController.clear();
    confirmNewPasswordController.clear();
  }

  Future<void> resetPassword() async {
    try {
      emit(ResetPasswordLoadingState());
      final resetToken = CacheHelper.sharedPreferences.getString('reset_token');
      final response = await dio.post(
        "https://flask-full-auth.onrender.com/auth/reset-password/$resetToken",
        data: {
          "new_password": newPasswordController.text,
          "new_password_confirmation": confirmNewPasswordController.text,
        },
      );
      if (response != null && response is Map<String, dynamic>) {
        resetPasswordModel = ResetPasswordModel.fromJson(response);

        emit(ResetPasswordSuccessState());
      } else {
        emit(
          ResetPasswordFailureState(
              errMessage: 'Invalid response from the server'),
        );
      }
    } on Exception catch (e) {
      emit(ResetPasswordFailureState(errMessage: e.toString()));
    }
  }
}
