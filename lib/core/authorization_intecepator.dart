
 import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'apis.dart';

String? API_KEY = '';

//* Request methods PUT, POST, PATCH, DELETE needs access token,
//* which needs to be passed with "Authorization" header as Bearer token.
class AuthorizationInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (_needAuthorizationHeader(options)) {
      final prefs = getIt<SharedPreferences>();
      if(prefs.getString(Apis.token) !=null) {
        API_KEY= prefs.getString(Apis.token)!;
        options.headers[Apis.authorization] = ' $API_KEY';
        options.headers[Apis.contentType] = Apis.jsonType;

      }
    }
    super.onRequest(options, handler);
  }

  bool _needAuthorizationHeader(RequestOptions options) {
    if (options.method == 'GET') {
      return true;
    } else {
      return true;
    }
  }
}