class LoginModel {
  final String message;
  final String refreshToken;
  final String accessToken;

  LoginModel({
    required this.message,
    required this.refreshToken,
    required this.accessToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
      accessToken: json['access_token'],
    );
  }
}
