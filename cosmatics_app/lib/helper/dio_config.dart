import 'package:cosmatics_app/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfig {
  String baseUrl = AppConstants.BASE_URL;

  Dio get dio {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Accept': 'application/json',
      },
    );
    Dio dio = Dio(baseOptions);
    dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ),
      PrettyDioLogger(requestBody: true, requestHeader: true),
    ]);
    return dio;
  }
}
