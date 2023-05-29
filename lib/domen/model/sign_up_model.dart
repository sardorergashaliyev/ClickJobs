// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

class SignUpModel {
    SignUpModel({
        required this.username,
        required this.email,
        required this.password,
        required this.role,
    });

    String username;
    String email;
    String password;
    String role;

    factory SignUpModel.fromRawJson(String str) => SignUpModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "role": role,
    };
}