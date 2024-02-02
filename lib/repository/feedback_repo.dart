import 'package:akdmvisitorsapp/graphql/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class FeedbackRepo {
  GraphQLConfig graphQLConfig;

  FeedbackRepo(this.graphQLConfig);

  Future<QueryResult> submitFeedbackData(String query,
      {required Map<String, dynamic> variables}) async {
    MutationOptions options = MutationOptions(
      document: gql(query),
      variables: variables,
    );
    return await graphQLConfig.client.mutate(options);
  }
}
