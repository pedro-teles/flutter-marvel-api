import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:http_interceptor/models/request_data.dart';

class ConnectorClientInterceptor extends InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint('REQUEST DATA:');
    debugPrint('URL: ${data.url}');
    debugPrint('HEADERS: ${data.headers}');
    debugPrint('BODY: ${data.body}');

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint('RESPONSE DATA:');
    debugPrint('STATUS CODE: ${data.statusCode}');
    debugPrint('HEADERS: ${data.headers}');
    debugPrint('BODY: ${data.body}');

    return data;
  }
}

class Connector {
  final String baseUrl = 'http://gateway.marvel.com/v1/public/';
  final client = InterceptedClient.build(
    interceptors: [ConnectorClientInterceptor()],
    requestTimeout: const Duration(seconds: 10),
  );
  final Map<String, dynamic> requestParameters = {
    'apikey': '7aad2c2cad314c843b0d3a2374b49a39',
    'ts': 1,
    'hash': '095de9a5a1e8e35ee7d1f6ff41dd17ba'
  };
}
