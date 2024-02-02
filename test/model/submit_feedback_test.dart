import 'dart:convert';
import 'dart:io';

import 'package:akdmvisitorsapp/model/feedback/submit_feedback.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  /*group(
    'Feedback from test case',
    () {
      List<Record> recordsListModel = [
        Record(
          fieldName: 'Name',
          fieldValue: 'Admin',
        ),
      ];
      final feedbackFormModel = SubmitFeedback(record: recordsListModel);
      final feedbackFormListModel =
          AppJsonModel(submitFeedback: feedbackFormModel);
      test(
        'Test case for Feedback form',
        () async {
          var dir = Directory.current.path;
          var jsonFilePath = File('$dir/test/json/submit_feedback_test.json')
              .readAsStringSync();
          final Map<String, dynamic> jsonMap = json.decode(jsonFilePath);
          expect(jsonMap['record'][0],
              feedbackFormListModel.submitFeedback!.record![0].toJson());
        },
      );
      //json map proper json data
      test(
        'Test for Map JSON proper data',
        () async {
          final jsonMapResult = feedbackFormListModel;
          final expectedJsonMap = {
            "record": [
              {"fieldName": "Name", "fieldValue": "Admin"}
            ]
          };
          expect(jsonMapResult.submitFeedback!.record![0].toJson(),
              expectedJsonMap['record']![0]);
        },
      );
    },
  );*/

  group('Record Model Test', () {
    test('Create Record from JSON', () {
      final Map<String, dynamic> json = {
        'fieldName': 'Name',
        'fieldValue': 'Admin',
      };

      final record = Record.fromJson(json);

      expect(record.fieldName, 'Name');
      expect(record.fieldValue, 'Admin');
    });

    test('Convert Record to JSON', () {
      final record = Record(fieldName: 'Password', fieldValue: 'test');

      final json = record.toJson();

      expect(json['fieldName'], 'Password');
      expect(json['fieldValue'], 'test');
    });
  });


  group('SubmitFeedback Model Test', () {
    test('Create SubmitFeedback from JSON', () {
      final Map<String, dynamic> jsonMap = {
        'record': [
          {
            'fieldName': 'Name',
            'fieldValue': 'Admin',
          },
          {
            'fieldName': 'Gender',
            'fieldValue': 'Male',
          },
        ],
      };

      final submitFeedback = SubmitFeedback.fromJson(jsonMap);

      expect(submitFeedback.record, isNotNull);
      expect(submitFeedback.record!.length, 2);
      expect(submitFeedback.record![0].fieldName, 'Name');
      expect(submitFeedback.record![0].fieldValue, 'Admin');
      expect(submitFeedback.record![1].fieldName, 'Gender');
      expect(submitFeedback.record![1].fieldValue, 'Male');
    });

    test('Convert SubmitFeedback to JSON', () {
      final record1 = Record(fieldName: 'Name', fieldValue: 'Admin');
      final record2 = Record(fieldName: 'Gender', fieldValue: 'Male');
      final submitFeedback = SubmitFeedback(record: [record1, record2]);

      final json = submitFeedback.toJson();

      expect(json['record'], isNotNull);
      expect(json['record'] is List, true);
      expect(json['record'].length, 2);
    });

  });





}
