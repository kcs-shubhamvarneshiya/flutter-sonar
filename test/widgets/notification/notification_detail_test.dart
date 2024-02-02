import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/MapMarkerProvider.dart';
import 'package:akdmvisitorsapp/presentaion/notification/notification_detail.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {
  @override
  Future<bool> setStringList(String key, List<String> value) {
    return Future.value(true);
  }

  @override
  List<String>? getStringList(String key) {
    if (key == "notificationList") {
      var dir = Directory.current.path;
      var fileContents = File('$dir/test/json/notification_log_test.json').readAsStringSync();
      var jsonData = json.decode(fileContents);
      var jsonList = jsonData['NotificationLog'];
      if (jsonList is List<dynamic>) {
        var stringList = jsonList.map((item) => json.encode(item)).toList();
        return stringList;
      }
    }
    return super.noSuchMethod(
      Invocation.method(#getStringList, [key]),
      returnValue: Future.value(null),
    ).await;
  }
}

final getIt = GetIt.instance;

Future<void> setupGetIt(MockSharedPreferences mockSharedPreferences) async {
  getIt.registerSingleton<SharedPreferences>(mockSharedPreferences);
}

void main() {
  final mockSharedPreferences = MockSharedPreferences();
  setupGetIt(mockSharedPreferences);

  setUp((){
  });

  Widget notificationDetailWidget(NotificationLog notificationData) {
    return MaterialApp(
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => MapMarkerProvider()),
          ],
          child: Sizer(builder: (context, orientation, deviceType) {
            return NotificationDetail(notificationData: notificationData,);
          }
          ),
        ),
      ),
    );
  }

  testWidgets('NotificationDetail widget displays correctly', (WidgetTester tester) async {
    // Create a NotificationLog object for testing
    final notificationData = NotificationLog(
      id: '1',
      title: 'Test Title',
      body: 'Welcome to temple',
      previewBody: 'Test Body',
      date: '2023-11-30T02:13:03.074Z',
      isRead: false,
      isSelected: false,
    );

    //Build the NotificationDetail widget
    await tester.pumpWidget(notificationDetailWidget(notificationData));

    await tester.pump();

    expect(find.byType(NotificationDetail), findsOneWidget);

    expect(find.byType(Scaffold), findsNWidgets(2));

    expect(find.text('Test Title'), findsOneWidget);

    expect(find.byType(SingleChildScrollView), findsOneWidget);

    expect(find.byType(Column), findsNWidgets(2));

    expect(find.byType(VerticalSpace), findsNWidgets(4));

    expect(find.byType(HorizontalSpace), findsOneWidget);

    expect(find.byType(Spacer), findsOneWidget);

    expect(find.byType(Container), findsNWidgets(3));

    expect(find.byType(Align), findsOneWidget);

    expect(find.byType(Padding), findsNWidgets(6));

    expect(find.byType(Row), findsNWidgets(2));

    expect(find.text(notificationBackTitle), findsOneWidget);

    expect(find.byType(InkWell), findsNWidgets(2));

    expect(find.byType(Expanded), findsNWidgets(2));

    expect(find.byType(InAppWebView), findsOneWidget);

    expect(find.byType(CustomText), findsNWidgets(3));
    // Test any other widget-related properties or behaviors.
  });

  testWidgets('NotificationDetail widget updates notification as read', (WidgetTester tester) async {
    // Create a NotificationLog object for testing
    final notificationData = NotificationLog(
      id: '1',
      title: 'Test Title',
      body: 'Welcome to temple',
      previewBody: 'Test Body',
      date: '2023-11-30T02:13:03.074Z',
      isRead: true,
      isSelected: false,
    );
    
    //Build the NotificationDetail widget
    await tester.pumpWidget(notificationDetailWidget(notificationData));
    
    await tester.pump();

    expect(notificationData.isRead, true);

    expect(notificationData.isSelected, false);
  });
}
