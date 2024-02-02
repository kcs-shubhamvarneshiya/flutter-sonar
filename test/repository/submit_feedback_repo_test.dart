import 'package:akdmvisitorsapp/graphql/graphql_config.dart';
import 'package:akdmvisitorsapp/repository/feedback_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';

// Mock dependencies
class MockGraphQLConfig extends Mock implements GraphQLConfig {}
class MockGraphQLClient extends Mock implements GraphQLClient {}
class MockMutationOptions extends Mock implements MutationOptions {}

class MockFeedbackRepo extends Mock implements FeedbackRepo{
  final mockGraphQLConfig = MockGraphQLConfig();
  final mockGraphQLClient = MockGraphQLClient();

  @override
  Future<QueryResult> submitFeedbackData(String query, {required Map<String, dynamic> variables}) {
    MutationOptions options = MutationOptions(
      document: gql(query),
      variables: variables,
    );
    return mockGraphQLConfig.client.mutate(options);
  }
}

void main() {
  group('FeedbackRepo Test', () {
    late MockFeedbackRepo mockFeedbackRepo;
    late MockGraphQLConfig mockGraphQLConfig;

    setUp(() {
      mockGraphQLConfig = MockGraphQLConfig();
      //feedbackRepo = FeedbackRepo(mockGraphQLConfig);
      mockFeedbackRepo = MockFeedbackRepo();
    });

    test('submitFeedbackData should return a QueryResult', () async {
      const query = r'''
      mutation SubmitFeedback($records: [Record], $userId: String) {
        submitFeedback(records: $records, userId: $userId) {
          createFeedbackRecord
        }
      }
    ''';

      final variables = {
        "records": [
          {"id": 1, "text": "Feedback 1"},
          {"id": 2, "text": "Feedback 2"},
        ],
        "userId": "12345",
      };

      final expectedQueryResult = QueryResult(
        data: <String, dynamic>{'result': 'success'}, options: QueryOptions(
          document: gql(query),
          variables: variables,
      ), source: QueryResultSource.network);


      final result = await mockFeedbackRepo.submitFeedbackData(query,variables: variables);

      expect(result, equals(expectedQueryResult));

      expect(result, isNotNull);

      expect(result.source, QueryResultSource.network);

      verify(mockGraphQLConfig.client.mutate(MutationOptions(
        document: gql(query),
        variables: variables,
      ))).called(1);
    });
  });

}




