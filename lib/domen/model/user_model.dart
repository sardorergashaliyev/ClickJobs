// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

class UserModel {
  UserModel({
    required this.id,
    required this.username,
    this.bio,
    required this.email,
    required this.password,
    required this.image,
    this.resume,
    this.phone,
    required this.isVerified,
    required this.token,
    required this.allowToPost,
    required this.role,
    this.saved,
    required this.createdAt,
    required this.updatedAt,
  });

  String? id;
  String? username;
  dynamic bio;
  String? email;
  String? password;
  String? image;
  dynamic resume;
  dynamic phone;
  bool isVerified;
  String? token;
  bool allowToPost;
  String? role;
  dynamic saved;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        bio: json["bio"],
        email: json["email"],
        password: json["password"],
        image: json["image"],
        resume: json["resume"],
        phone: json["phone"],
        isVerified: json["isVerified"],
        token: json["token"],
        allowToPost: json["allowToPost"],
        role: json["role"],
        saved: json["saved"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "bio": bio,
        "email": email,
        "password": password,
        "image": image,
        "resume": resume,
        "phone": phone,
        "isVerified": isVerified,
        "token": token,
        "allowToPost": allowToPost,
        "role": role,
        "saved": saved,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}