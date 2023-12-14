import 'package:dio/dio.dart';
import 'package:testassign/constants/api_urls.dart';

class ApiUtil {
  late Dio _dio;

  void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<dynamic> get({
    required String path,
    required Map<String, dynamic>? queryParams,
  }) async {
    try {
      Response response = await _dio.get(
        path,
        queryParameters: queryParams,
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}


//search/repositories?q=flutter
