import 'package:clickjobs/domen/service/app_constants.dart';
import 'package:dio/dio.dart';

abstract class DioService {
  DioService._();

  static Dio client({
    String? token,
  }) {
    return Dio(BaseOptions(
      baseUrl: AppConstant.baseUrl,
      headers: {
        if (token != null) "Authorization": "Bearer $token",
        'Accept': 'application/json',
        'Content-type': 'application/json'
      },
    ))
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: false));
  }
}
