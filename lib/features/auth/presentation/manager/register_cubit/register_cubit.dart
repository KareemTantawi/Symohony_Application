import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symphony_app/core/services/network/api/api_endpoints.dart';
import 'package:symphony_app/core/services/network/api/dio_consumer.dart';
import 'package:symphony_app/features/auth/data/models/register_model.dart';
import 'package:symphony_app/features/auth/presentation/manager/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.api) : super(RegisterInitialState());
  DioConsumer api;
  RegisterModel? registerModel;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void clearControllers() {
    userNameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> register() async {
    try {
      emit(RegisterLoadingState());
      final response = await api.post(
        EndPoints.register,
        data: {
          "username": userNameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "confirm_password": confirmPasswordController.text,
          "phone": phoneController.text,
        },
      );

      if (response != null && response is Map<String, dynamic>) {
        registerModel = RegisterModel.fromJson(response);

        emit(RegisterSuccessState());
      } else {
        emit(
          RegisterFailureState(errMessage: 'Invalid response from the server'),
        );
      }
    } on Exception catch (e) {
      emit(RegisterFailureState(errMessage: e.toString()));
    }
  }
}
