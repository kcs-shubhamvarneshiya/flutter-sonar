import 'package:akdmvisitorsapp/common_widgets/custom_dialog.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bluetooth_headset/bluetooth_headset_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/visit/play_video.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pod_player/pod_player.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  //Mocking required parameters and creating a test widget
  const String videoUrl = 'https://www.example.com/sample_video.mp4';
  const bool isVimeo = false;
  late BluetoothHeadsetBloc bluetoothBloc;

  setUp(() {
    bluetoothBloc = BluetoothHeadsetBloc();
  });

  Widget playVideoWidget() {
    return MaterialApp(
      home: Scaffold(
        body:  MultiBlocProvider(
        providers: [
          BlocProvider<BluetoothHeadsetBloc>(
            create: (context) => bluetoothBloc,
          ),
    ],
        child:Sizer(builder: (context, orientation, deviceType) {
          return PlayVideoScreen(
            videoUrl: videoUrl,
            isVimeo: isVimeo,
          );
        }),
      ),
      ),
    );
  }

  testWidgets('PlayVideoScreen Widget Test', (WidgetTester tester) async {

    await tester.pumpWidget(playVideoWidget());

    await tester.pump();

    expect(find.byType(PlayVideoScreen), findsOneWidget);

    expect(find.byType(Scaffold), findsNWidgets(2));

    expect(find.byType(AppBar), findsOneWidget);

    expect(find.byType(Column), findsWidgets);

    expect(find.byType(PodVideoPlayer), findsNothing);

    expect(find.byType(CustomText), findsNothing);

    expect(find.text(captionText), findsOneWidget);

    expect(find.byType(ListTile), findsNothing);

    expect(find.byType(CustomDialog), findsOneWidget);

    expect(find.text('Error: Connection failed'), findsOneWidget);

  });
}