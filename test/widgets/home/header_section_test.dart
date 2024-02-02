import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/notification/fcm_notification_service.dart';
import 'package:akdmvisitorsapp/presentaion/home/header_section.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/service/remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MockVideoPlayerController extends Mock implements VideoPlayerController {

  @override
  Future<void> initialize() {
    return Future.value(null);
  }

  @override
  VideoPlayerValue get value =>
      const VideoPlayerValue(
        isInitialized: true,
        // Mock the video as initialized
        isPlaying: true,
        // Set isPlaying to true or false as needed for your test
        duration: Duration(seconds: 60),
      );
}

class MockFcmNotificationService extends Mock implements FcmNotificationService {}
class MockRemoteConfig extends Mock implements RemoteConfig {}

final getIt = GetIt.instance;

Future<void> setupLocator(MockFcmNotificationService mockFcmNotificationService, MockRemoteConfig mockRemoteConfig) async {
  getIt.registerSingleton<FcmNotificationService>(mockFcmNotificationService);
  getIt.registerSingleton<RemoteConfig>(mockRemoteConfig);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockFcmNotificationService=MockFcmNotificationService();
  final mockRemoteConfig=MockRemoteConfig();
  setupLocator(mockFcmNotificationService,mockRemoteConfig);

  setUp(() {
    final mockRemoteConfig = MockRemoteConfig();
  });

  Widget headerSectionWidget() {
    return MaterialApp(
      home: Scaffold(
        body: Sizer(builder: (context, orientation, deviceType) {
          return HeaderSection();
        }),
      ),
    );
  }

  testWidgets('HeaderSection displays video when initialized', (
      WidgetTester tester) async {
    // Build the HeaderSection widget.
    final mockVideoController = MockVideoPlayerController();

    await tester.pumpWidget(headerSectionWidget());

    // Verify that the video player is displayed.
    expect(find.byType(VideoPlayer), findsOneWidget);

    expect(find.byType(Shimmer), findsOneWidget);

    expect(find.byType(Stack), findsWidgets);

    expect(find.byType(Container), findsWidgets);

    expect(find.byType(Directionality), findsWidgets);

    expect(find.byType(OutlinedButton), findsWidgets);

    final buttonFinder = find.byIcon(Icons.arrow_back);
    expect(buttonFinder, findsOneWidget);

    // Simulate a tap on the button
    await tester.tap(buttonFinder);
    await tester.pump();

    // Verify if the navigation occurred
    expect(find.byType(HomeBottomNavRoute), findsOneWidget);

    // Verify that the video is playing (paused video won't be displayed).
    expect(find.byType(VideoPlayer), mockVideoController.value.isInitialized);

    expect(find.byType(VideoPlayer), mockVideoController.value.isPlaying);

    expect(find.text("Explore"), findsOneWidget);

  });

}