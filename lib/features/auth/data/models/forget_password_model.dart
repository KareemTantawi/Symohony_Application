class ForgetPasswordModel {
  final String message;
  final String resetToken;

  ForgetPasswordModel({
    required this.message,
    required this.resetToken,
  });
  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      message: json['message'] ?? '',
      resetToken: json['reset_token'] ?? '',
    );
  }
}
