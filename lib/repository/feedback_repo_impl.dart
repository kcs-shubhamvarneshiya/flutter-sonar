import 'package:akdmvisitorsapp/graphql/query_files.dart';
import 'package:akdmvisitorsapp/model/feedback/submited_response_model.dart';
import 'package:akdmvisitorsapp/repository/feedback_repo.dart';
import 'package:akdmvisitorsapp/utils/failure.dart';
import 'package:async/async.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/feedback/submit_feedback.dart';
import '../utils/constants.dart';

abstract class SubmitFeedbackModelDataSource {
  Future<Result<FeedBackResponseModel>> submitFeedbackData(
      SharedPreferences sp, List<Record> records, FeedbackRepo feedbackRepo);
}

@injectable
class SubmitFeedbackModelImpl implements SubmitFeedbackModelDataSource {
  @override
  Future<Result<FeedBackResponseModel>> submitFeedbackData(
      SharedPreferences sp,
      List<Record> records,
      FeedbackRepo feedbackRepo) async {
    QueryResult? result;
    try {
      var userId = sp.getString(Constant.deviceToken);
      /// initialize feedback repo
      result = await feedbackRepo.submitFeedbackData(GraphQLQuery.submitFeedback(), variables: {
         "record": records,
          "userId": userId,
        },
      );
      print('Res - $result');
      FeedBackResponseModel? model;
      if (!result.hasException) {
        ///handle response into model
        model = FeedBackResponseModel.fromJson(result.data!);
      }
      ///Right the entity model
      return Result.value(FeedBackResponseModel()
          .toEntity(model!.createFeedbackRecord.toString()));
    } on ServerException {
      return Result.error(const ServerFailure(''));
    } on CommonFailure catch (e) {
      return Result.error(CommonFailure(e.message));
    }
  }
}
