import 'dart:convert';
import 'dart:io';

import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/utils/preference_utils.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:akdmvisitorsapp/utils/constants.dart';
import 'package:akdmvisitorsapp/utils/failure.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:async/async.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../graphql/query_files.dart';
import '../model/app_json/new_api_json_model.dart';


abstract class AppJsonService {
  Future<Result<AppJsonApiModel>> getLoadJsonData();
}

@Injectable(as: AppJsonService)
class AppJsonModelImpl implements AppJsonService {
  late AppJsonApiModel? resultList;

  AppJsonModelImpl(this.repository, this.sharedPreferences);

  SharedPreferences sharedPreferences;
  AppJsonRepository repository;


  Future<String> get filePath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  @override
  Future<Result<AppJsonApiModel>> getLoadJsonData() async {
    var lastDate = sharedPreferences.getString(keyJSONFileDownloadDatePref);
    try {
      final directory = await filePath;
      var result = await repository.loadJsonAPIData(
        GraphQLQuery.getAPIData(),
        variables: {
          "data": {
            "last_modified_time":
            lastDate, /*KEY_JSON_FILE_DOWNLOAD_DATE*/
          }
        },
      );
      AppJsonApiModel resultList = AppJsonApiModel();
      if (!result.hasException) {
        resultList = AppJsonApiModel.fromJson(result.data!);
        if (resultList.readFileFromS3?.file != null) {
          Directory dirPath = Directory(directory);
          File filePathName = File("${dirPath.path}${Platform.pathSeparator}${Constant.jsonAppContentFileName}");
          await filePathName
              .writeAsString(json.encode(resultList.readFileFromS3!.file),
              mode: FileMode.writeOnly)
              .then((value) {
            sharedPreferences.setString(keyJSONFileDownloadDatePref, DateTime.now().toUtc().toIso8601String());
            setMapLocationFromJson();
            print('File saved at path: ${value.path.toString()}');
            sharedPreferences.setBool(keyJSONFileDownloadPath, true);
          });
        }else{
          sharedPreferences.setBool(keyJSONFileDownloadPath, true);
          print('It seems you have an updated file: ${json.encode(resultList.readFileFromS3)}');
        }
      }else{
        final directory = await getApplicationDocumentsDirectory();
        String savePath = '${directory.path}/${Constant.jsonAppContentFileName}';
        bool exist = await File(savePath).exists();
        if(exist) {
          sharedPreferences.setBool(keyJSONFileDownloadPath, true);
        }else{
          sharedPreferences.setBool(keyJSONFileDownloadPath, false);
          print('something went wrong:');

        }
        print('something went wrong:');
      }
      return Result.value(resultList);
    } on ServerException {
      return  Result.error(const ServerFailure(''));
    }on CommonFailure catch (e) {
      return Result.error(CommonFailure(e.message));
    }
  }

  Future<void> setMapLocationFromJson() async {
    AppJsonModel jsonDataRepo = await repository.loadJsonAssetData();
    List<Attraction>? locationList = <Attraction>[];
    if ((jsonDataRepo.attractions ?? []).isNotEmpty) {
      locationList = jsonDataRepo.attractions;
    }
    setString(keyMapLocationsJsonEngPref, jsonEncode(locationList));
  }
}



