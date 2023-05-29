// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

class TokenModel {
    TokenModel({
        required this.message,
        required this.token,
    });

    String message;
    String token;

    factory TokenModel.fromRawJson(String str) => TokenModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
    };
}