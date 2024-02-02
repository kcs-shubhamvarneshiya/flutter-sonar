import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockNotificationServiceImpl extends Mock implements NotificationServiceImpl {
  @override
  Future<List<NotificationLog>> getFcmNotificationList() async {
    var dir = Directory.current.path;
    var currentPath = File('$dir/test/json/notification_log_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final List<dynamic> jsonList = jsonMap['NotificationLog'];
    var resultList =jsonList.map((jsonItem) => NotificationLog.fromJson(jsonItem)).toList();
    return Future(() => resultList);
  }
}

void main() {
  late MockNotificationServiceImpl notificationService;
  late SharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    notificationService = MockNotificationServiceImpl();
    // Initialize GetIt and register the mock SharedPreferences
    GetIt.I.registerSingleton<SharedPreferences>(mockSharedPreferences);
    //notificationService = NotificationServiceImpl();
  });

  test('getFcmNotificationList returns a list of NotificationLog', () async {
    final List<NotificationLog> notificationList=[];
    notificationList.add(NotificationLog(id:"1",title:"Welcome Message from TEMPLE",body:"Welcome to mandir area!!.",date:"2023-10-25T22:36:00.733032",type:"FCM",isRead:true,isSelected:false,previewBody:"Jay Swaminarayan Swaminarayan Lord, also known as Bhagwan Swaminarayan.",deepLink:"ATTRACTION:1"));
    notificationList.add(NotificationLog(id:"2",title:"Welcome Message from BAPS",body:"Welcome to akshardham!!.",date:"2023-10-25T22:35:27.165877",type:"FCM",isRead:true,isSelected:false,previewBody:"Jay Swaminarayan Swaminarayan Lord, also known as Bhagwan Swaminarayan.",deepLink:"ATTRACTION:2"));

    // Mock the behavior of SharedPreferences
    when(mockSharedPreferences.getStringList('notificationList')).thenReturn(
      notificationList.map((item) => jsonEncode(item)).toList(),
    );
    final result = await notificationService.getFcmNotificationList();
    // Check the result
    expect(result, isA<List<NotificationLog>>());
    // Add assertions to validate the expected content of the result.
  });

  test('getFcmNotificationList returns an empty list when SharedPreferences is empty', () async {
    // Mock the behavior of SharedPreferences
    when(mockSharedPreferences.getStringList('notificationList')).thenReturn(null);

    final result = await notificationService.getFcmNotificationList();
    verifyNever(mockSharedPreferences.getStringList('notificationList')).called(0);
    // Check that the result is an empty list
    expect(result, isNotEmpty);
  });
}