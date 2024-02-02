import 'dart:io';

import 'package:akdmvisitorsapp/notification/fcm_notification_service.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_state.dart';
import 'package:akdmvisitorsapp/presentaion/introduction/introduction.dart';
import 'package:akdmvisitorsapp/presentaion/splash/splash_screen.dart';
import 'package:akdmvisitorsapp/repository/appjson_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

/*void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //get Path from Folder
  File _getProjectFile(String path) {
    final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS']!;
    return File('$assetFolderPath/$path');
  }

  group('Splash wit All render widget', () {

    Widget splashBar() {
      return const MaterialApp(home: Scaffold(body: SplashPage()));
    }

    testWidgets('List All Widgets on Splash Screen ', (WidgetTester tester) async {
      await tester.pumpWidget(splashBar());
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(Container), findsWidgets);
      // expect(find.byType(Stack), findsWidgets);
    });

    test('get specified the path of assets', () {

      var path  = IconPaths.splashImage;
        final exists = _getProjectFile(path).existsSync();
        expect(exists, isTrue, reason: '$path does not exist');
      });
  });
}*/

class MockFcmNotificationService extends Mock implements FcmNotificationService {}

class MockAppJsonService extends Mock implements AppJsonService{}

final getIt = GetIt.instance;

Future<void> setupGetIt(MockAppJsonService mockService, MockFcmNotificationService mockFcmNotificationService) async {
  getIt.registerSingleton<AppJsonService>(mockService);
  getIt.registerSingleton<FcmNotificationService>(mockFcmNotificationService);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final mockFcmNotificationService = MockFcmNotificationService();
  final mockService = MockAppJsonService();
  late AppJsonAPIBloc appJsonApiBloc;

  setupGetIt(mockService,mockFcmNotificationService);

  setUp((){
    appJsonApiBloc = AppJsonAPIBloc();
    appJsonApiBloc.add(const LoadAppJsonEvent());
  });

  Widget splashWidget() {
    return MaterialApp(
      home: Scaffold(
        body:BlocProvider<AppJsonAPIBloc>(
        create: (context) => appJsonApiBloc,
              child: const SplashPage()
        )
      ),
    );
  }

  testWidgets('SplashPage widget test', (WidgetTester tester) async {
    // Create a mock FcmNotificationService

    // Build the SplashPage widget
    await tester.pumpWidget(splashWidget());

    // Expect that the video initializes and plays
    await expectLater(
      find.byType(SplashPage),
      matchesGoldenFile('splash_page_test.png'), // Replace with your image comparison logic
    );

    // Simulate the API data loading
    final apiBloc = GetIt.I<AppJsonAPIBloc>();
    apiBloc.add(const LoadAppJsonEvent());

    // Wait for the API data to load
    await tester.pump(const Duration(seconds: 2)); // Adjust the duration as needed

    // Verify that _onApiDataLoaded is called
    verify(mockFcmNotificationService.configureFCMNotifications()).called(1);

    expect(find.byType(IntroductionScreen), findsOneWidget);
  });
}


