import 'package:akdmvisitorsapp/common_widgets/header_footer_home.dart';
import 'package:akdmvisitorsapp/service/remote_config.dart';
import 'package:akdmvisitorsapp/utils/BottomNavNotifier.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MockRemoteConfig extends Mock implements RemoteConfig{}

class MockSharedPreferences extends Mock implements SharedPreferences{
  @override
  List<String>? getStringList(String key){
    if (key == "notificationList") {
      List<String> stringlist=['{"title": "Test Notification", "isRead": false}', '{"title": "Read Notification", "isRead": true}'];
      return stringlist;
    }
  }
}
final getIt = GetIt.instance;

Future<void> setupLocator(MockRemoteConfig mockRemoteConfig, MockSharedPreferences mockMockSharedPreferences) async {
  getIt.registerSingleton<RemoteConfig>(mockRemoteConfig);
  getIt.registerSingleton<SharedPreferences>(mockMockSharedPreferences);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final mockRemoteConfig = MockRemoteConfig();
  final mockMockSharedPreferences = MockSharedPreferences();
  setupLocator(mockRemoteConfig,mockMockSharedPreferences);

  Widget headerFooterWidget() {
    return MaterialApp(
      home: Scaffold(
        body: Sizer(
          builder: (context, orientation, deviceType) {
            mockRemoteConfig;
            return const HeaderFooterHome();
          },
        ),
      ),
    );
  }

  testWidgets('HeaderFooterHome widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(headerFooterWidget());

    await tester.pump();

    final headerFooterHomeFinder = find.byType(HeaderFooterHome);

    expect(headerFooterHomeFinder, findsOneWidget);

    expect(mockRemoteConfig, isNotNull);

    // Verify that the SharedPreferences are reloaded

    final listString = mockMockSharedPreferences.getStringList(notificationList);

    expect(listString, isNotNull);

    expect(listString, isNotEmpty);

    // Verify that the notification count is updated based on unread notifications
    expect(updateValue.countValueNotifier.value, 1);

  });
}