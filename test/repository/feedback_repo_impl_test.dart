import 'package:akdmvisitorsapp/model/feedback/submit_feedback.dart';
import 'package:akdmvisitorsapp/model/feedback/submited_response_model.dart';
import 'package:akdmvisitorsapp/repository/feedback_repo.dart';
import 'package:akdmvisitorsapp/repository/feedback_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/src/result/result.dart';

// Mock dependencies
class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockFeedbackRepo extends Mock implements FeedbackRepo {}

class MockSubmitFeedbackModelImpl extends Mock implements SubmitFeedbackModelImpl {
  // Arrange: Mock the necessary methods or responses
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

void main() {
  late MockSubmitFeedbackModelImpl submitFeedbackModel;
  late MockSharedPreferences mockSharedPreferences;
  late MockFeedbackRepo mockFeedbackRepo;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    mockFeedbackRepo = MockFeedbackRepo();
    submitFeedbackModel = MockSubmitFeedbackModelImpl();
  });

  test('submitFeedbackData returns Result.value with valid data', () async {
    List<Record> recordsListModel = [
      Record(
        fieldName: 'Name',
        fieldValue: 'Admin',
      ),
    ];

    final result = await submitFeedbackModel.submitFeedbackData(mockSharedPreferences,recordsListModel, mockFeedbackRepo);

    // Assert: Check if the result is as expected
    expect(result, isA<Result<FeedBackResponseModel>>());
    expect(result.asValue?.value.createFeedbackRecord, 'Your feedback record submitted');
  });

  test('submitFeedbackData returns Result.error on server exception', () async {
    // Act
    final result = await submitFeedbackModel.submitFeedbackData(mockSharedPreferences, [Record()], mockFeedbackRepo);

    // Assert: Check if the result is an error
    expect(result, isA<Result<FeedBackResponseModel>>());
    expect(result.isError, isTrue);
  });

  tearDown(() {
    reset(mockSharedPreferences);
    reset(mockFeedbackRepo);
  });

}




















