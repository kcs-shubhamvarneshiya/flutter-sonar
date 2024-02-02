

/*void main() {
  AppJsonModelImpl appJsonModelImpl;
  SharedPreferences.setMockInitialValues({});
  WidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    appJsonModelImpl = AppJsonModelImpl();
  });

  group('Load JSON From IMPL class', () {
    test('JSON data IMPL', () async {
      appJsonModelImpl = AppJsonModelImpl();
      final data = appJsonModelImpl.getLoadJsonData();
      expect(data, data);
    });
  });
}*/

import 'package:akdmvisitorsapp/graphql/graphql_config.dart';
import 'package:akdmvisitorsapp/graphql/query_files.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {
}
class MockGraphQLConfig extends Mock implements GraphQLConfig {
  @override
  GraphQLClient get client => MockGraphQLClient(); // Return the mock GraphQLClient
}

void main() {
  late AppJsonRepository appJsonRepository;
  late MockGraphQLConfig mockGraphQLConfig;
  late MockGraphQLClient mockGraphQLClient;

  setUp(() {
    mockGraphQLClient = MockGraphQLClient();
    mockGraphQLConfig = MockGraphQLConfig();
    appJsonRepository = AppJsonRepository(mockGraphQLConfig);
  });

  group('loadJsonAPIData', () {
    test('should return a QueryResult', () async {
      // Define the query and variables
      final query = GraphQLQuery.getAPIData();
      final variables = <String, dynamic>{
        'data': {
          'last_modified_time': '2023-10-23T20:34:47.880178',
        },
      };

      // Create a QueryResult to mock the response
      final queryResult = QueryResult(
        source: QueryResultSource.network,
        options: QueryOptions(
          document: gql(query),
          variables: variables,
        ),
      );

      QueryOptions options = QueryOptions(
          fetchPolicy: FetchPolicy.networkOnly,
          document: gql(query),
          variables: variables);
      // Mock the behavior of the GraphQLClient's query method
      when(mockGraphQLClient.query(options)).thenAnswer((_) async => queryResult);
      //when(mockGraphQLClient.query(any)).thenAnswer((_) async => queryResult);

      // Call the method under test
      final result = await appJsonRepository.loadJsonAPIData(query, variables: variables);

      // Verify that the result matches your expectations
      expect(result, equals(queryResult));
    });
  });
}
