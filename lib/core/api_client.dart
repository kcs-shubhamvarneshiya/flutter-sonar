import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'apis.dart';

part 'api_client.g.dart';



@RestApi(baseUrl: Apis.DOMAIN)
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(Apis.validate)
  Future<int> validate();

  @POST(Apis.logout)
  Future<int> logout();
}

