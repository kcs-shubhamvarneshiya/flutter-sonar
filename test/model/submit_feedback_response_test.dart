import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/feedback/submited_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Feedback from test case',
        () {

      final feedbackFormModel = FeedBackResponseModel(createFeedbackRecord: "Your feedback record submitted");

      test('Test case for Feedback form', () async {
          var dir = Directory.current.path;
          var jsonFilePath = File('$dir/test/json/submit_feedback_response_test.json').readAsStringSync();
          final Map<String, dynamic> jsonMap = json.decode(jsonFilePath);
          var result=FeedBackResponseModel.fromJson(jsonMap);
          expect(result.createFeedbackRecord,"Your feedback record submitted");
        },
      );

      //json map proper json data
      test(
        'Test for Map JSON proper data',
            () async {
          final jsonMapResult = feedbackFormModel;
          final expectedJsonMap = {
                "createFeedbackRecord": "Your feedback record submitted"
          };
          expect(jsonMapResult.toJson(), expectedJsonMap);
        },
      );

      test('toEntity() should create a new instance with given createFeedbackRecord', () {
        final createFeedbackRecord = 'New FeedbackRecord update.';

        // Act
        final updatedModel = feedbackFormModel.toEntity(createFeedbackRecord);

        // Assert
        expect(updatedModel.createFeedbackRecord, createFeedbackRecord);
      });

    },
  );
}





