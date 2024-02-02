import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/notification_container.dart';
import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  File getProjectFile(String path) {
    final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS']!;
    return File('$assetFolderPath/$path');
  }

  DateTime? toDate(String? stringDate) {
    DateTime dt = DateTime.parse(stringDate!);
    return dt;
  }

  testWidgets('NotificationContainer widget test', (WidgetTester tester) async {
    // Create a testbed with the NotificationContainer widget
    final notificationLst= NotificationLog(
      // Provide required fields here for the notificationLst
      isSelected: true,
      isRead: false,
      title: 'Test Notification',
      date: '2023-11-08T12:00:00Z',
      body: 'This is a test notification',
    );
    await tester.pumpWidget(
      MaterialApp(
        home: Sizer(builder: (context, orientation, deviceType) {
            return NotificationContainer(
              notificationLst: notificationLst,
              isLongPressSelected: true,
            );
          }
        ),
      ),
    );

    expect(find.text('Test Notification'), findsOneWidget);

    expect(find.text('This is a test notification'), findsOneWidget);

    expect(find.text(toDate(notificationLst.date.toString())!.getVerboseDateTimeRepresentation()), findsOneWidget);

    expect(find.byType(CustomText), findsNWidgets(3));

    expect(find.byType(Container), findsNWidgets(5));

    var path  = IconPaths.checkNotificationIcon;
    final exists = getProjectFile(path).existsSync();
    expect(exists, isTrue, reason: '$path does not exist');

  });

}