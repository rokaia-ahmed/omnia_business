import 'package:dio/dio.dart';
import 'dio_interceptors.dart';
import '../end_points.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        followRedirects: false,
        receiveDataWhenStatusError: true,
        validateStatus: (status) => status! < 500,
      ),
    );

   // dio?.interceptors.add(CustomApiInterceptor());

    /// DIO [HEADERS]
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };

    /// DIO [INTERCEPTORS]
    dio!.interceptors.addAll({
      AppInterceptors(dio!),
      LogInterceptor(responseBody: true, requestBody: true),
    });
  }

  /// METHOD [POST] DATA FROM API
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    data,
  }) async {
    return await dio!.post(
      url,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  /// METHOD [PATCH] DATA FROM API
  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    data,
  }) async {
    return await dio!.patch(
      url,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  /// METHOD [GET] DATA FROM API
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    data,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
      data: data,
    );
  }

  /// METHOD [POST] DATA FROM API
  static Future<Response> updateData({
    required String url,
    Map<String, dynamic>? query,
    data,
  }) async {
    return await dio!.put(url, data: data, queryParameters: query);
  }

  /// METHOD [DELETE] DATA FROM API
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    data,
  }) async {
    return await dio!.delete(url,data: data ,queryParameters: query);
  }
}

/*
class CustomApiInterceptor extends Interceptor {
  final log = LoggerDebug(headColor: LogColors.red, constTitle: "Server Gate Logger");
  CustomApiInterceptor();
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.red("\x1B[37m------ Current Error Response (status code ${err.response?.statusCode}) -----\x1B[0m", err.requestOptions.path);
    log.red("\x1B[31m${jsonEncode(err.response?.data)}\x1B[0m", err.requestOptions.path);
    log.green(_generateCurlCommand(err.requestOptions));
    return super.onError(err, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    log.green("------ Current Response (status code ${response.statusCode}) ------", response.requestOptions.path);
    log.green(jsonEncode(response.data), response.requestOptions.path);
    log.green(_generateCurlCommand(response.requestOptions));
    return super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.yellow("------ Current Request Path -----", options.path);
    log.yellow("${options.path} ${LogColors.red}API METHOD : (${options.method})${LogColors.reset}", options.path);
    if (options.data != null) {
      log.cyan("------ Current Request body Data -----", options.path);
      if (options.data is FormData) {
        Map<String, dynamic> body = {};
        for (var element in (options.data as FormData).fields) {
          body[element.key] = element.value;
        }
        for (var element in (options.data as FormData).files) {
          body[element.key] = '${element.value.filename}';
        }

        log.cyan(jsonEncode(body), options.path);
      } else {
        log.cyan(jsonEncode(options.data), options.path);
      }
    }
    log.white("------ Current Request Parameters Data -----", options.path);
    log.white(jsonEncode(options.queryParameters), options.path);
    log.yellow("------ Current Request Headers -----", options.path);
    log.yellow(jsonEncode(options.headers), options.path);
    return super.onRequest(options, handler);
  }

  String _generateCurlCommand(RequestOptions options) {
    final method = options.method;
    final url = options.uri.toString();
    final headers = options.headers;
    final data = options.data;

    // Start building the cURL command
    final curlCommand = StringBuffer("curl -X $method '$url'");

    // Add headers
    headers.forEach((key, value) {
      curlCommand.write(" -H '$key: $value'");
    });

    // Add body if present
    if (data != null) {
      if (data is FormData) {
        final formDataMap = {
          for (var entry in data.fields) entry.key: entry.value,
          for (var file in data.files) file.key: file.value.filename,
        };
        curlCommand.write(" --data '${jsonEncode(formDataMap)}'");
      } else if (data is Map) {
        curlCommand.write(" --data '${jsonEncode(data)}'");
      } else {
        curlCommand.write(" --data '$data'");
      }
    }

    return curlCommand.toString();
  }
}*/
