import 'package:akdmvisitorsapp/model/feedback/submit_feedback.dart';
import 'package:akdmvisitorsapp/model/feedback/submited_response_model.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_state.dart';
import 'package:akdmvisitorsapp/repository/feedback_repo.dart';
import 'package:akdmvisitorsapp/repository/feedback_repo_impl.dart';
import 'package:akdmvisitorsapp/service/connection_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:async/src/result/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSubmitFeedbackModelDataSource extends Mock implements SubmitFeedbackModelDataSource{}

class MockSubmitFeedbackModelImpl extends Mock implements SubmitFeedbackModelImpl {
  static const feedbackRecord = 'Your feedback record submitted';
  @override
  Future<Result<FeedBackResponseModel>> submitFeedbackData(
      SharedPreferences sp,
      List<Record> records,
      FeedbackRepo feedbackRepo) async {
    final appJsonFeedbackModel = FeedBackResponseModel(createFeedbackRecord: feedbackRecord);
    return Result.value(appJsonFeedbackModel);
  }
}

class MockFeedbackRepo extends Mock implements FeedbackRepo {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockConnectionStatus extends Mock implements IConnectionStatus{
  bool _connected = false;

  @override
  bool get connect => _connected;

  @override
  void setStatus(bool connection) {
    _connected = connection;
  }
}

GetIt sl = GetIt.instance;

Future<void> setupGetIt(MockConnectionStatus mockConnectionStatus) async {
  sl.registerSingleton<IConnectionStatus>(mockConnectionStatus);
}

class MockToastPackage extends Mock implements Fluttertoast{
  //static const errorMessage = 'An error occurred';
  String? capturedMessage;
  String showToast(String message) {
    return capturedMessage = message;
  }
}


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final mockFeedbackModelImpl = MockSubmitFeedbackModelImpl();
  final mockFeedbackRepo = MockFeedbackRepo();
  final mockSharedPreferences = MockSharedPreferences();
  final mockConnectionStatus = MockConnectionStatus();
  final mockToast = MockToastPackage();

  late SubmitFeedbackBloc submitFeedbackBloc;
  setupGetIt(mockConnectionStatus);
  const errorMessage = 'No internet connectivity.';

  setUp(() {
    submitFeedbackBloc = SubmitFeedbackBloc(mockFeedbackModelImpl, mockFeedbackRepo, mockSharedPreferences);
    mockConnectionStatus.setStatus(true);
  });

  List<Record> recordsListModel = [
    Record(
      fieldName: 'Name',
      fieldValue: 'Admin',
    ),
  ];


  group('SubmitFeedbackBloc', () {
      const feedbackRecord = 'Your feedback record submitted';

      blocTest<SubmitFeedbackBloc, SubmitFeedbackState>(
        'emits the expected states when SubmitFeedbackData is successful',
        setUp: () {
         },
        build: () => submitFeedbackBloc,
        act: (bloc) {
          bloc.add(SubmitFeedbackData(recordsListModel));
        } ,
        expect:() => [
          const SubmitFeedbackState.feedbackLoading(true),
          const SubmitFeedbackState.feedbackLoaded(feedbackRecord),
        ],
      );

      blocTest<SubmitFeedbackBloc, SubmitFeedbackState>(
        'emits the expected states when there is an error',
        setUp: () {
          mockConnectionStatus.setStatus(false);
        },
        build: () => submitFeedbackBloc,
        act: (bloc) => bloc.add(const SubmitFeedbackData([])),
        expect:() => [
         mockToast.showToast(errorMessage)
        ],
      );

      test('record list returns an empty list or not', () async {
        final result = recordsListModel;
        expect(result, isNotEmpty);
      });


      tearDown(() {
        submitFeedbackBloc.close();
      });

  });
}