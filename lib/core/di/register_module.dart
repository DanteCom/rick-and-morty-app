import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/'));
    return dio;
  }
}
