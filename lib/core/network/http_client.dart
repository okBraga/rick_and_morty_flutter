import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class HttpResponse {
  HttpResponse(this.status, this.url, this.headers, this.data);

  final Object? data;
  final int? status;
  final Uri? url;
  final Map<String, Object>? headers;
}

class HttpException implements Exception {
  HttpException(this.message, this.response);

  final String? message;
  final HttpResponse? response;
}

abstract class HttpClient {
  Future<HttpResponse> get({required String path, Map<String, Object>? queryParameters, Map<String, Object>? headers});
}

@Singleton(as: HttpClient)
class DioAdapter implements HttpClient {
  final Dio _dio;

  DioAdapter(this._dio);

  HttpResponse _createResponse(Response<dynamic>? response) {
    return HttpResponse(response?.statusCode, response?.realUri, response?.headers.map, response?.data);
  }

  @override
  Future<HttpResponse> get({required String path, Map<String, Object>? queryParameters, Map<String, Object>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _createResponse(response);
    } on DioException catch (exception) {
      final response = exception.response;
      throw HttpException(exception.message, _createResponse(response));
    }
  }
}
