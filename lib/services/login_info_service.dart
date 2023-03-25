import 'dart:convert';

import 'package:bloc_task/blocs/login/login_event.dart';
import 'package:bloc_task/config/api_constants.dart';
import 'package:http/http.dart';

LoginInfoActivity loginInfoActivityFromJson(String str) =>
    LoginInfoActivity.fromJson(json.decode(str));

String loginInfoActivityToJson(LoginInfoActivity data) =>
    json.encode(data.toJson());

class LoginInfoActivity {
  LoginInfoActivity({
    required this.error,
    required this.type,
  });

  Error error;
  String type;

  factory LoginInfoActivity.fromJson(Map<String, dynamic> json) =>
      LoginInfoActivity(
        error: Error.fromJson(json["error"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "error": error.toJson(),
        "type": type,
      };
}

class Error {
  Error({
    required this.email,
    required this.password,
  });

  List<String> email;
  List<String> password;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        email: List<String>.from(json["email"].map((x) => x)),
        password: List<String>.from(json["password"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": List<dynamic>.from(email.map((x) => x)),
        "password": List<dynamic>.from(password.map((x) => x)),
      };
}

class LoginInfoService {
  Future<LoginInfoActivity> getLoginInfoActivity() async {
    final response = await get(Uri.parse(ApiConstants.baseUrl));
    final activity = loginInfoActivityFromJson(response.body);
    return activity;
  }
}
