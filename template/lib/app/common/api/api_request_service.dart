import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:template/app/common/api/token_service.dart';

import 'http_response_handler.dart';

class ApiRequestService {
  final String authority;
  final String unencodePath;
  final HttpResponseHandler httpHandler;
  final TokenService tokenService;

  Future<String?> get _jwToken {
    return tokenService.getToken();
  }

  ApiRequestService(
      {required this.authority,
      required this.unencodePath,
      required this.httpHandler,
      required this.tokenService});

  Future<Map<String, String>> _setHeaders(Map<String, String>? headers) async {
    headers ??= <String, String>{};
    var token = await _jwToken;
    headers.putIfAbsent(
        HttpHeaders.contentTypeHeader, () => 'application/json');
    headers.putIfAbsent(HttpHeaders.authorizationHeader, () => 'Bearer $token');
    return headers;
  }

  Future<http.Response> post(
      {required String endpoint,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    return await httpHandler.handleHttpResponse(http.post(
        Uri.https(authority, '$unencodePath/$endpoint'),
        body: body,
        headers: headers));
  }

  Future<http.Response> get(
      {required String endpoint,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) async {
    var _query = query ?? <String, dynamic>{};
    return await httpHandler.handleHttpResponse(http.get(
        Uri.https(authority, '$unencodePath/$endpoint', _query),
        headers: headers));
  }

  Future<http.Response> put(String endpoint, Map<String, dynamic> body,
      {Map<String, String>? headers}) async {
    return await httpHandler.handleHttpResponse(http.put(
        Uri.https(authority, '$unencodePath/$endpoint'),
        headers: headers,
        body: body));
  }

  Future<http.Response> postWithToken(
      {required String endpoint,
      required Object? body,
      Map<String, String>? headers}) async {
    headers = await _setHeaders(headers);

    return await httpHandler.handleHttpResponse(http.post(
        Uri.https(authority, '$unencodePath/$endpoint'),
        headers: headers,
        body: jsonEncode(body)));
  }

  Future<http.Response> getWithToken(
      {required String endpoint,
      Map<String, String>? headers,
      Map<String, dynamic>? query}) async {
    headers = await _setHeaders(headers);

    return await httpHandler.handleHttpResponse(http.get(
        Uri.https(authority, '$unencodePath/$endpoint', query),
        headers: headers));
  }

  Future<http.Response> putWithToken(
      {required String endpoint,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    headers = await _setHeaders(headers);

    return await httpHandler.handleHttpResponse(http.put(
        Uri.https(authority, '$unencodePath/$endpoint'),
        body: body,
        headers: headers));
  }

  Future<http.Response> deleteWithToken(
      {required String endpoint,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    headers = await _setHeaders(headers);
    return await httpHandler.handleHttpResponse(http.delete(
        Uri.https(authority, '$unencodePath/$endpoint'),
        body: body,
        headers: headers));
  }
}
