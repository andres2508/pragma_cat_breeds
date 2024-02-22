import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cat_breeds/infrastructure/configuration/global.configuration.dart';
import 'package:cat_breeds/infrastructure/http/http.interceptor.dart';
import 'package:cat_breeds/ui/framework/failure.model.dart';
import 'package:http/http.dart';

typedef ItemCreator<S> = S Function(Map<String, dynamic> json);

class HttpInterceptors {
  static final List<RequestInterceptor> _requestInterceptors = [];
  static final List<ResponseInterceptor> _responseInterceptors = [];

  static addRequestInterceptor(RequestInterceptor interceptor) {
    _requestInterceptors.add(interceptor);
  }

  static addResponseInterceptor(ResponseInterceptor interceptor) {
    _responseInterceptors.add(interceptor);
  }
}

class HttpDataSource {
  final String _authority;
  final String _basePath;
  final client = HttpClient();

  HttpDataSource(this._basePath, {String? authority})
      : _authority =
            authority ?? GlobalPragmaConfiguration.controller.apiServer {
    client.connectionTimeout = const Duration(seconds: 10);
  }

  Uri baseUri({String? path, Map<String, dynamic>? queryParams}) {
    String finalPath = _getPath(path);
    if (_authority.startsWith('http://')) {
      String authorityClear = _authority.replaceAll('http://', '');
      return Uri.http(_getAuthorityClear(authorityClear),
          _extractFinalPath(authorityClear, finalPath), queryParams);
    } else if (_authority.startsWith('https://')) {
      String authorityClear = _authority.replaceAll('https://', '');
      return Uri.https(_getAuthorityClear(authorityClear),
          _extractFinalPath(authorityClear, finalPath), queryParams);
    }
    throw Failure.of('Url invalida $_authority');
  }

  String _getPath(String? path) {
    String finalPath = _basePath;
    if (path != null && _basePath != '') {
      finalPath = '$_basePath/$path';
    } else if (path != null) {
      finalPath = path;
    }
    return finalPath;
  }

  String _getAuthorityClear(String authority) {
    int indexOfAuthorityExtraPath = authority.indexOf('/');
    return indexOfAuthorityExtraPath >= 0
        ? authority.substring(0, indexOfAuthorityExtraPath)
        : authority;
  }

  String _extractFinalPath(String authority, String path) {
    int indexOfAuthorityExtraPath = authority.indexOf('/');
    String head = indexOfAuthorityExtraPath >= 0
        ? authority.substring(indexOfAuthorityExtraPath, authority.length)
        : "";
    return head != "" && head != "/" ? "$head$path" : "$path";
  }

  Future<List<X>> getList<X>(String? path, ItemCreator<X> itemCreator,
      {Map<String, dynamic>? queryParameters}) async {
    Uri uri = baseUri(path: path, queryParams: queryParameters);
    final request = Request('GET', uri);
    var response = await executeRequest(request);
    Iterable jsonIterator = jsonDecode(response.body);
    final list = List<X>.from(jsonIterator.map((data) => itemCreator(data)));
    return Future.value(list);
  }

  Future<X> getItem<X>(
      {String? path,
      required ItemCreator<X> itemCreator,
      Map<String, dynamic>? queryParameters}) async {
    Uri uri = baseUri(path: path, queryParams: queryParameters);
    final request = Request('GET', uri);
    var response = await executeRequest(request);
    final json = jsonDecode(response.body);
    final mapped = itemCreator(json);
    return Future.value(mapped);
  }

  Future<X> post<X>(
      {String? path,
      dynamic body,
      ItemCreator<X>? itemCreator,
      Map<String, dynamic>? queryParameters}) async {
    Uri uri = baseUri(path: path, queryParams: queryParameters);
    final request = Request('POST', uri);
    request.body = json.encode(body);
    var response = await executeRequest(request);
    if (itemCreator != null) {
      final json = jsonDecode(response.body);
      return Future.value(itemCreator(json));
    } else {
      return Future.value();
    }
  }

  Future<X> put<X>(
      {String? path, dynamic body, ItemCreator<X>? itemCreator}) async {
    Uri uri = baseUri(path: path);
    final request = Request('PUT', uri);
    request.body = json.encode(body);
    var response = await executeRequest(request);
    if (itemCreator != null) {
      final json = jsonDecode(response.body);
      return Future.value(itemCreator(json));
    } else {
      return Future.value();
    }
  }

  Future<X> delete<X>(
      {String? path,
      Map<String, String>? queryParameters,
      ItemCreator<X>? itemCreator}) async {
    Uri uri = baseUri(path: path, queryParams: queryParameters);
    final request = Request('DELETE', uri);
    var response = await executeRequest(request);
    if (itemCreator != null) {
      final json = jsonDecode(response.body);
      return Future.value(itemCreator(json));
    } else {
      return Future.value();
    }
  }

  Future<Response> executeRequest(Request request) async {
    try {
      _interceptRequest(request);
      var response = await Response.fromStream(
          await request.send().timeout(const Duration(seconds: 20)));
      _interceptResponse(response);
      _checkAndThrowError(response);
      return response;
    } on TimeoutException {
      throw _connectionError();
    }
  }

  void _checkAndThrowError(Response response) {
    if (response.statusCode >= HttpStatus.badRequest) {
      final reason = response.reasonPhrase != null
          ? "Reason: ${response.reasonPhrase!} Body: ${response.body}"
          : 'Body: ${response.body}';
      throw Failure.of('An error occurred while making the request.: $reason');
    }
  }

  Failure _connectionError() {
    return Failure.of('An error occurred while making the request.'
        ' Please verify that you are connected to the internet and try again.');
  }

  void _interceptResponse(Response response) {
    for (final interceptor in HttpInterceptors._responseInterceptors) {
      interceptor.interceptResponse(response);
    }
  }

  void _interceptRequest(Request request) {
    for (final interceptor in HttpInterceptors._requestInterceptors) {
      interceptor.interceptRequest(request);
    }
  }
}
