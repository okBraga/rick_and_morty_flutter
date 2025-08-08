import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class HttpClient {
  Future<Map<String, dynamic>> get(String url);
}

@Singleton(as: HttpClient)
class DioAdapter implements HttpClient {
  final Dio _dio;

  DioAdapter(this._dio);

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
