import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/feedback/feedback_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Feedback from test case', () {
      //options list model
      List<FeedbackOptions> optionsListModel = [
        FeedbackOptions(
          key: 'male',
          value: 'Male',
        ),
      ];
      //fields list model
      List<Fields> fieldModelList = [
        Fields(
          options: optionsListModel,
          required: true,
          fieldName: 'Name',
          fieldType: 'textBox',
        )
      ];
      final feedbackFormModel = FeedbackForm(
        submitLink: 'http://www.rysun.com',
        fields: fieldModelList,
      );
      final feedbackFormListModel = AppJsonModel(feedbackForm: feedbackFormModel);

      test(
        'Test case for Feedback form',
        () async {
          var dir = Directory.current.path;
          var jsonFilePath = File('$dir/test/json/feedback_form_test.json').readAsStringSync();
          final Map<String, dynamic> jsonMap = json.decode(jsonFilePath);
          final result = AppJsonModel.fromJson(jsonMap);
          expect(result.feedbackForm, feedbackFormListModel.feedbackForm);
        },
      );

      //json map proper json data
      test('Test for Map JSON proper data',
        () async {
          final jsonMapResult = feedbackFormListModel;
          final expectedJsonMap = {
            "feedbackForm": {
              "submitLink": "http://www.rysun.com",
              "fields": fieldModelList,
            }
          };
          expect(jsonMapResult.feedbackForm!.toJson(), expectedJsonMap['feedbackForm']);
        },
      );


      //json map proper json data
      test('Test for Map JSON proper data fields', () async {

          final jsonMapResult = feedbackFormListModel;

          final expectedJsonMap = {
            "fields": [
            {
              "options": [FeedbackOptions()],
              "required": true,
              "fieldName": "Gender",
              "fieldType": "radio",
              "answer": null
            }
            ]
          };
          expect(jsonMapResult.feedbackForm!.fields![0].toJson(), expectedJsonMap['fields']);
        },
      );

      test('Test for Map JSON proper data options', () async {
        final jsonMapResult = feedbackFormListModel;

        final expectedJsonMap = {
            "options": [
              {
                "key": "male",
                "value": "Male",
                "isChecked":null
              }
            ]
        };

        expect(jsonMapResult.feedbackForm!.fields![0].options![0].toJson(), expectedJsonMap['options']);

      },
      );

    },
  );
}
