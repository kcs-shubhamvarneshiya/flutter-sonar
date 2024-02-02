import 'package:akdmvisitorsapp/graphql/graphql_config.dart';
import 'package:akdmvisitorsapp/model/remote_config.dart';
import 'package:akdmvisitorsapp/service/remote_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockRemoteConfig extends Mock implements RemoteConfig{}

void main() {
  group('GraphQLConfig', () {
    late GraphQLConfig graphQLConfig;
    late MockSharedPreferences mockSharedPreferences;
    late MockRemoteConfig mockRemoteConfig;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      mockRemoteConfig = MockRemoteConfig();
      graphQLConfig = GraphQLConfig(mockSharedPreferences, mockRemoteConfig);
    });

    test('Initialization', () {
      // Ensure that the initialization of the GraphQLConfig sets the properties correctly.
      expect(graphQLConfig.apiConfig.baseUrl, 'api_base_url');
      expect(graphQLConfig.prefs, mockSharedPreferences);
    });

    test('initSharedPreferences', () async {
      await graphQLConfig.initSharedPreferences();
      expect(graphQLConfig.userId, 'user_id');
    });

    test('clientToQuery', () {
      final graphQLClient = graphQLConfig.clientToQuery();

      // Validate the creation of GraphQLClient and the link configuration.
      expect(graphQLClient.link, isA<AuthLink>());
      expect(graphQLClient.link, isA<HttpLink>());
    });
  });
}