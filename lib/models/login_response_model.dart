class LoginResponse {
  int statusCode;
  String message;
  Data data;

  LoginResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  String accessToken;

  Data({required this.accessToken});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accessToken: json['accessToken'],
    );
  }
}
