import 'package:clickjobs/domen/model/sign_up_model.dart';
import 'package:clickjobs/domen/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../model/token_model.dart';

abstract class AuthFacade {
  Future<Either<TokenModel, String>> login(String email, String password);

  Future<Either<TokenModel, String>> logOut();

  Future<Either<UserModel, String>> getUser(BuildContext context);
  Future<Either<SignUpModel, String>> createUser(
    String username,
    String email,
    String password,
    String role,
  );
}
