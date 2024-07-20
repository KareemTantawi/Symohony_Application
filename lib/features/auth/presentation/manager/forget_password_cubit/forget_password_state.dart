class ForgetPasswordState {}

class ForgetPasswordInitialState extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {}

class ForgetPasswordFailureState extends ForgetPasswordState {
  final String errMessage;

  ForgetPasswordFailureState({required this.errMessage});
}
