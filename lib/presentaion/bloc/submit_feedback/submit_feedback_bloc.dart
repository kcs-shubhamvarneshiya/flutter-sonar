import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_state.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../../../model/feedback/submited_response_model.dart';
import '../../../repository/feedback_repo.dart';
import '../../../repository/feedback_repo_impl.dart';
import '../../../service/connection_service.dart';
import '../../../utils/strings.dart';


@injectable
class SubmitFeedbackBloc
    extends Bloc<SubmitFeedbackEvent, SubmitFeedbackState> {
  SubmitFeedbackModelImpl repository;
  FeedbackRepo feedbackRepo;
  SharedPreferences sp;
  IConnectionStatus? iConnectionStatus;
  SubmitFeedbackBloc(this.repository,this.feedbackRepo,this.sp):iConnectionStatus = getIt<IConnectionStatus>(),super(const SubmitFeedbackState.feedbackLoading(false)) {
    on<SubmitFeedbackData>(submitFeedbackJsonData);
  }

  submitFeedbackJsonData(SubmitFeedbackData event, emit) async {
    if (iConnectionStatus!.connect) {
      emit(const SubmitFeedbackState.feedbackLoading(true));
      Result<FeedBackResponseModel> resultResponse = await repository!
          .submitFeedbackData(sp, event.record, feedbackRepo);
      if (resultResponse.asValue!.value.createFeedbackRecord!.isNotEmpty) {
        emit(SubmitFeedbackState.feedbackLoaded(
            resultResponse.asValue!.value.createFeedbackRecord.toString()));
      } else {
        emit(SubmitFeedbackState.feedbackError(resultResponse.asError.toString()));
      }
    }else{
      if(iConnectionStatus!.connect !=true){
        showToastInternet(webpageConnectivityMessage);
      }
    }
  }
}
