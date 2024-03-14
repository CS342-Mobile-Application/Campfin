import 'package:dio/dio.dart';
import 'package:mobile_campfin/data/interceptor/DioInterceptor.dart';
import 'package:mobile_campfin/models/login_response_model.dart';

//
class DioClient {
  // final Dio _dio = Dio(BaseOptions(baseUrl: dotenv.env["BASE_API_URL"]!));
  final Dio _dio = Dio(BaseOptions(
      baseUrl: 'https://prokittikun-campfin-backend.skjhoq.easypanel.host'));

  DioClient() {
    _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;

  Future<LoginResponse> login(Map<String, dynamic> data) async {
    Response response = await _dio.post('/auth/login', data: data);
    if (response.statusCode == 201) {
      Map<String, dynamic> jsonData = response.data;
      print(jsonData);
      return LoginResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Response> register(Map<String, dynamic> data) async {
    return await _dio.post('/auth/register', data: data);
  }
}
