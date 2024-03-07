import 'package:dio/dio.dart';
import 'package:mobile_campfin/data/interceptor/DioInterceptor.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: "http://localhost:3000"));

  DioClient() {
    _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;

  Future<Response> login(Map<String, dynamic> data) async {
    return await _dio.post('auth/login', data: data);
  }

  Future<Response> register(Map<String, dynamic> data) async {
    return await _dio.post('auth/register', data: data);
  }
}
