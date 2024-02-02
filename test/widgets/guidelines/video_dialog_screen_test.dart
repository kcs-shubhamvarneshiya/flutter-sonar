import 'package:akdmvisitorsapp/presentaion/guidelines/video_dialog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pod_player/pod_player.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget videoDialogScreenWidget() {
    return MaterialApp(
      home: Scaffold(
        body:Sizer(builder: (context, orientation, deviceType) {
            return VideoDialogScreen(
              videoUrl: 'https://www.youtube.com/watch?v=wrjlHJeLfIU',
              isVimeo: false, // Set according to your test scenario
            );
          }),
        ),
    );
  }

  testWidgets('VideoDialogScreen Widget Test', (WidgetTester tester) async {

    await tester.pumpWidget(videoDialogScreenWidget());

    await tester.pump();

    expect(find.byType(VideoDialogScreen), findsOneWidget);

    expect(find.byType(Scaffold), findsNWidgets(2));

    expect(find.byType(Column), findsOneWidget);

    expect(find.byType(PodVideoPlayer), findsOneWidget);

    await tester.pump();

  });
}