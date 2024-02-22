import 'package:http/http.dart';

mixin RequestInterceptor {
  void interceptRequest(Request request);
}

mixin ResponseInterceptor {
  void interceptResponse(Response response);
}

class HttpContentTypeRequestInterceptor implements RequestInterceptor {
  @override
  void interceptRequest(Request request) {
    request.headers['Content-Type'] = 'application/json';
  }
}
