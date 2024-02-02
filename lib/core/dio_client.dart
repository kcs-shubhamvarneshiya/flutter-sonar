import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'authorization_intecepator.dart';
import 'logger_intecaptor.dart';

Dio getDio() {
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15000),
      receiveTimeout: const Duration(seconds: 15000),
      responseType: ResponseType.json,
    ),
  )..interceptors.addAll([
      AuthorizationInterceptor(),
      LoggerInterceptor(),
    ]);
  return dio;
}
