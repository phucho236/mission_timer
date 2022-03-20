import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:get/get.dart' as getx;
import 'package:mission_timer/core/clients/network_client.dart';
import 'package:mission_timer/core/config/app_config.dart';
import 'package:mission_timer/core/helper/enum/enum.dart';

class DioClient extends NetworkClient<dynamic, DioParams> {
  static final DioClient _instance = DioClient._internal();

  DioClient._internal();

  factory DioClient() {
    return _instance;
  }

  //final Storage storageService = getx.Get.find();

  @override
  Future<dynamic> call(DioParams fields, {String? contentType}) async {
    String url = '';
    if (fields.url == null) {
      url = '${AppConfig.instance?.apiUrl}${fields.endpoint}';
    } else {
      url = '${fields.url}${fields.endpoint}';
    }
    if (fields.params != null) {
      url += '?';

      if (fields.params != null) {
        fields.params!.forEach((key, value) {
          url += '$key=$value&';
        });
      }
    }
    Map<String, String> header = fields.headers ?? Map<String, String>();
    if (fields.needAuthrorize) {
      //using hive here
      // String? token = await storageService.getToken();
      // header['Authorization'] = 'Bearer ${token ?? ''}';
      // log(token.toString());
    }
    log('=======>${fields.httpMethod}: $url ${fields.body.toString()}');
    try {
      final rawResponse = (await _connect(fields.httpMethod,
          url: url,
          headers: header,
          body: fields.body,
          contentType: contentType));
      var response;
      if (fields.shouldHandleResponse)
        response = rawResponse.handleError(fields.allowedStatusCodes);
      else
        response = rawResponse.data;
      return response!;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> _connect(
    HttpMethod method, {
    required String url,
    String? contentType,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    Dio dio = Dio();
    if (headers != null) {
      dio.options = BaseOptions(
          headers: headers,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          followRedirects: false,
          validateStatus: (statusCode) {
            return statusCode! <= 1000;
          });
    }

    switch (method) {
      case HttpMethod.DELETE:
        return _handleCall(() async {
          return (await dio.delete(url,
              data:
                  //FormData.fromMap(body ?? {})
                  body,
              queryParameters: headers));
        });
      case HttpMethod.GET:
        return _handleCall(() async {
          final response = (await dio.get(url));
          return response;
        });
      case HttpMethod.POST:
        return _handleCall(() async {
          return (await dio.post(url, queryParameters: headers, data: body));
        });
      case HttpMethod.PUT:
        return _handleCall(() async {
          return (await dio.put(url, queryParameters: headers, data: body));
        });
      case HttpMethod.PATCH:
        return _handleCall(() async {
          return (await dio.patch(url, queryParameters: headers, data: body));
        });
      default:
        return _handleCall(() async {
          final response = (await dio.get(url, queryParameters: headers));
          return response;
        });
    }
  }

  Future<T> _handleCall<T>(Future<T> Function() onRequest) async {
    try {
      return onRequest().timeout(Duration(seconds: 25));
    } on TimeoutException catch (_) {
      throw 'Request timeout!!';
    } catch (e) {
      throw e.toString();
    }
  }
}

extension ResponseExtension on Response {
  Map<String, dynamic>? handleError(List<int> allowedStatusCodes) {
    if (this.data != null) {
      Map<String, dynamic> json;
      if ((allowedStatusCodes.contains(this.statusCode)) ||
          this.statusCode! < 400) {
        if (this.data is! Map<String, dynamic>)
          json = jsonDecode(this.data);
        else
          json = this.data;
        return json;
      } else {
        String errorText = "";
        if (this.data["errors"] != null) {
          inspect(this.data);
          Map<dynamic, dynamic> errors = this.data["errors"];
          if (errors.values.isEmpty ||
              errors.values.toList()[0] == null ||
              (errors.values.toList()[0] as List).isEmpty) {
            errorText = 'エラー！エラーが発生しました。しばらくしてからもう一度お試しください。';
          }
          errorText = errors.values.toList()[0][0];
        } else if (this.data["message"] != null && this.data["message"] != "") {
          errorText = this.data["message"];
        } else {
          errorText = 'エラー！エラーが発生しました。しばらくしてからもう一度お試しください。';
        }
        throw errorText;
      }
    }
  }
}

class DioParams {
  final HttpMethod httpMethod;
  final String? url;
  final String endpoint;
  final bool dynamicResponse;
  final Map<String, String>? headers;
  final Map<String, String>? params;
  final dynamic body;
  final bool needAuthrorize;
  final bool shouldHandleResponse;
  final List<int> allowedStatusCodes;

  DioParams(this.httpMethod,
      {this.url,
      required this.endpoint,
      this.headers,
      this.params,
      this.body,
      this.dynamicResponse = false,
      this.needAuthrorize = true,
      this.shouldHandleResponse = true,
      this.allowedStatusCodes = const []});
}
