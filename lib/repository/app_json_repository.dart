import 'dart:convert';
import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../graphql/graphql_config.dart';
import '../model/app_json/app_json.dart';
import '../utils/constants.dart';

@injectable
class AppJsonRepository {
  GraphQLConfig graphQLConfig;

  AppJsonRepository(this.graphQLConfig);

  Future<AppJsonModel> loadJsonAssetData() async {
    // Below code is to use the static file from asset folder of the project
    //var jsonData = json.decode(await rootBundle.loadString(IconPaths.appJson));
    // Below code is to use the dynamic file stored in document directory from Admin Server
    final directory = await getApplicationDocumentsDirectory();
    File filePathName = File(
        "${directory.path}${Platform.pathSeparator}${Constant.jsonAppContentFileName}");
    print("loadJsonAssetData > ${filePathName.path}");
    var storageJsonData = await filePathName.readAsString();
    var jsonData = json.decode(storageJsonData);
    return AppJsonModel.fromJson(jsonData);
  }

  Future<QueryResult> loadJsonAPIData(String query, {required Map<String, dynamic> variables}) async {
    //initialize graphQl
    QueryOptions options = QueryOptions(
        fetchPolicy: FetchPolicy.networkOnly,
        document: gql(query),
        variables: variables);

    final result = await graphQLConfig.client.query(options);

    return result;
  }

}
