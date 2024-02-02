import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/appbar_widget.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/presentaion/notification/notification_screen.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

final getIt = GetIt.instance;

Future<void> setupGetIt(MockSharedPreferences mockSharedPreferences) async {
  getIt.registerSingleton<SharedPreferences>(mockSharedPreferences);
}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockSharedPreferences = MockSharedPreferences();
  setupGetIt(mockSharedPreferences);

  File getProjectFile(String path) {
    final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS']!;
    return File('$assetFolderPath/$path');
  }

  group('App bar widget test case', () {
    Widget appBar(bool isNotification) {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Material(
              child: AppbarWidget(
                notificationAppBarIcon: IconPaths.notificationIcon,
                userAppBarIcon: IconPaths.notificationIcon,
                appBarLogoImage: IconPaths.akdmLogo,
                appBarColor: ColorPath.secondaryTextColor,
                isNotification: isNotification,
              ),
            );
          },
        ),
      );
    }

    testWidgets('AppBar logo image available or not', (WidgetTester tester) async {

      await tester.pumpWidget(appBar(false));

      await tester.pump();

      expect(find.byType(Container), findsWidgets);

      expect(find.byType(Row), findsWidgets);

      expect(find.byType(GestureDetector), findsWidgets);

      expect(find.byType(Container), findsWidgets);

      expect(find.byType(InkWell), findsWidgets);

      expect(find.byType(Stack), findsWidgets);

      expect(find.byType(SizedBox), findsWidgets);

      expect(find.byType(Positioned), findsWidgets);

      expect(find.byType(ValueListenableBuilder), findsWidgets);


      expect(find.byType(CustomText), findsWidgets);

      var path = IconPaths.notificationIcon;
      final exists = getProjectFile(path).existsSync();
      expect(exists, isTrue, reason: '$path does not exist');

    });

    testWidgets('description', (widgetTester) async {
      await widgetTester.pumpWidget(appBar(true));

      await widgetTester.pump();

      final getIt = GetIt.instance;

      getIt.registerSingleton<NotificationScreen>(const NotificationScreen());

      expect(getIt.isRegistered<NotificationScreen>(), true);
    });
  });
}
