import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_appbar.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/MapMarkerProvider.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MockSharedPreferences extends Mock implements SharedPreferences{}

final getIt = GetIt.instance;

Future<void> setupLocator(MockSharedPreferences mockMockSharedPreferences) async {
  getIt.registerSingleton<SharedPreferences>(mockMockSharedPreferences);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final mockMockSharedPreferences = MockSharedPreferences();
  setupLocator(mockMockSharedPreferences);

  File getProjectFile(String path) {
    final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS']!;
    return File('$assetFolderPath/$path');
  }

  Widget appBar(bool isNotification) {
    return MaterialApp(
        home:Scaffold(
          body:MultiProvider(
            providers: [
              //Add your providers here
              ChangeNotifierProvider(create: (_) => MapMarkerProvider()),
            ],
            child: Sizer(
              builder: (context, orientation, deviceType) {
                return CustomAppBar(isNotification: isNotification);
              },
            ),
          ),
        ),
      );
  }

  testWidgets('AppBar logo image available or not', (WidgetTester tester) async {

    await tester.pumpWidget(appBar(true));

    expect(find.byType(CustomAppBar), findsOneWidget);

    expect(find.byType(Container), findsWidgets);

    expect(find.byType(Row), findsWidgets);

    expect(find.byType(InkWell), findsWidgets);

    //Verify that the notification icon is rendered when isNotification is true
    var path = IconPaths.notificationIcon;
    final exists = getProjectFile(path).existsSync();
    expect(exists, isTrue, reason: '$path does not exist');


  });
}

