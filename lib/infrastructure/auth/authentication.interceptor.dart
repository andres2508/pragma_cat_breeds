import 'package:cat_breeds/infrastructure/configuration/global.configuration.dart';
import 'package:cat_breeds/infrastructure/http/http.interceptor.dart';
import 'package:http/src/request.dart';

class AuthenticationInterceptor implements RequestInterceptor {
  @override
  void interceptRequest(Request request) {
    request.headers['x-api-key'] = GlobalPragmaConfiguration.controller.apikey;
  }
}
