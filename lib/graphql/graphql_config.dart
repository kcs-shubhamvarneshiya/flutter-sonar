import 'package:akdmvisitorsapp/utils/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/remote_config.dart';
import '../service/remote_config.dart';
import '../utils/strings.dart';

@singleton
class GraphQLConfig {
  SharedPreferences prefs;
  late ApiConfig apiConfig;
  late GraphQLClient client;
  String? userId;
  String? token;

  get apiUrlLink => HttpLink(
    apiConfig.baseUrl,
    defaultHeaders: {apiConfig.headerSecretKey: apiConfig.headerSecretValue},
  );

//Constant.headerUserId: GraphQLConfig().userId.toString(),

  ///if you want to pass token
/*  static ValueNotifier<GraphQLClient> graphInit() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: apiUrlLink,
        cache: GraphQLCache(
          store: InMemoryStore(),
        ),
      ),
    );
    return client;
  }*/

  GraphQLConfig(this.prefs, RemoteConfig remoteConfig) {
    apiConfig = remoteConfig.apiConfig;
    initSharedPreferences();
    client = clientToQuery();
  }

  // Initialize SharedPreferences
  Future<void> initSharedPreferences() async {
    userId = prefs.getString(Constant.deviceToken);
    token = prefs.getString(keySSOUserTokenPref);
    print('User Id${userId}');
  }

  GraphQLClient clientToQuery() {
    final AuthLink authLink = AuthLink(
        getToken: () async =>
            (token != null && token!.isNotEmpty) ? 'Bearer $token' : '');
    final Link link = authLink.concat(apiUrlLink);
    return GraphQLClient(
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      link: link,
    );
  }
}
