import 'dart:async';

import 'package:http/http.dart';
import 'package:template/app/common/exceptions/api_exception.dart';
import 'package:template/app/common/exceptions/unauthorize_exception.dart';

class HttpResponseHandler {
  Future handleHttpResponse(Future<Response> httpCall) async {
    var response = await httpCall;

    switch (response.statusCode) {
      case 200:
        return response;
      case 401:
        throw UnauthorizedException(response.body);
      default:
        throw ApiException(
            httpCode: response.statusCode, status: response.body);
    }
  }
}
