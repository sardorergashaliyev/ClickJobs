import 'package:clickjobs/domen/interface/auth_facade.dart';
import 'package:clickjobs/domen/model/sign_up_model.dart';
import 'package:clickjobs/domen/model/token_model.dart';
import 'package:clickjobs/domen/model/user_model.dart';
import 'package:clickjobs/domen/service/app_constants.dart';
import 'package:clickjobs/domen/service/dio_service.dart';
import 'package:clickjobs/domen/service/local_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class AuthRepo implements AuthFacade {
  bool isDataLoading = false;
  UserModel? userModel;
  @override

  // try {
  //   final token = LocalStore.getToken();
  //   var res = await DioService.client(token: token).get(
  //     "/me/profile",
  //   );
  //   if (res.statusCode == 200) {
  //     var res = await getUser(context, userId);
  //     if (res != null) {
  //       // ignore: use_build_context_synchronously
  //       await getUser(context, userId);
  //     }
  //   } else {
  //     return right(res.statusCode.toString());
  //   }
  //   return left(UserModel.fromJson(res.data));
  // } catch (e) {
  //   return right(ErrorHandler.getDioStatusMessage(e));
  // }

  @override
  Future<Either<TokenModel, String>> login(
      String email, String password) async {
    try {
      final res = await DioService.client()
          .post("/auth/signin", data: {"email": email, "password": password});
      if (res.statusCode == 200) {
        return left(TokenModel.fromJson(res.data));
      } else {
        return right(res.statusCode.toString());
      }
    } catch (e) {
      return right(e.hashCode.toString());
    }
  }

  @override
  Future<Either<UserModel, String>> getUser(BuildContext context) async {
    try {
      isDataLoading == true;
      final token = LocalStore.getToken();
      var res = await DioService.client(token: token).get(
        "${AppConstant.baseUrl}/me/profile",
      );
      if (res.statusCode == 200) {
        return left(UserModel.fromJson(res.data));
      } else {
        return right(res.statusCode.toString());
      }
    } catch (e) {
      // ignore: unnecessary_brace_in_string_interps
      print('Catch error: ${e}');
      return right(e.toString());
    }
  }

  @override
  Future<Either<SignUpModel, String>> createUser(
      String username, String email, String password, String role) async {
    try {
      final res = await DioService.client().post(
        "${AppConstant.baseUrl}/auth/signup",
        data: {
          'email': email,
          'password': password,
          'username': username,
          'role': role
        },
      );

      if (res.statusCode == 200) {
        return left(SignUpModel.fromJson(res.data));
      } else {
        return right(res.statusCode.toString());
      }
    } catch (e) {
      // ignore: unnecessary_brace_in_string_interps
      print('Catch error: ${e}');
      return right(e.toString());
    }
  }

  @override
  Future<Either<TokenModel, String>> logOut(VoidCallback onSuccess) {
    LocalStore.clear();
    onSuccess();
    throw UnimplementedError();
  }
  
  
  @override
  Future<Either<TokenModel, String>> verificateCode(String verCode) async {
    try {
      final res = await DioService.client().post(
        "${AppConstant.baseUrl}/auth/verify",
        data: {
          'code': verCode
        },
      );

      if (res.statusCode == 200) {
        return left(TokenModel.fromJson(res.data));
      } else {
        return right(res.statusCode.toString());
      }
    } catch (e) {
      // ignore: unnecessary_brace_in_string_interps
      print('Catch error: ${e}');
      return right(e.toString());
    }
  }
}
