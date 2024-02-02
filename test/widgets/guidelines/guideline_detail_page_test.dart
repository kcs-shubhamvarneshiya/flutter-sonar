import 'package:akdmvisitorsapp/common_widgets/ImageSliders/common_image_slider.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/guidelines/content.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bluetooth_headset/bluetooth_headset_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/guidelines/guideline_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late BluetoothHeadsetBloc bluetoothBloc;

  setUp(() {
    bluetoothBloc = BluetoothHeadsetBloc();
  });

  // Mocking required parameters and creating a test widget
  final Content mockContent = Content(
    text: 'Sample text',
    imageURL: ['https://www.example.com/sample_image.jpg'],
    videoUrl: 'https://www.example.com/sample_video.mp4',
  );

  Widget guidelineDetailPageWidget() {
    return MaterialApp(
      home: Scaffold(
        body:  MultiBlocProvider(
          providers: [
            BlocProvider<BluetoothHeadsetBloc>(
              create: (context) => bluetoothBloc,
            ),
          ],
          child:Sizer(builder: (context, orientation, deviceType) {
            return GuideLineDetailPage(
              content: mockContent,
            );
          }),
        ),
      ),
    );
  }

  testWidgets('GuideLineDetailPage Widget Test', (WidgetTester tester) async {

    await tester.pumpWidget(guidelineDetailPageWidget());

    await tester.pump();

    expect(find.byType(GuideLineDetailPage), findsOneWidget);

    expect(find.byType(Scaffold), findsOneWidget);

    expect(find.byType(CustomText), findsOneWidget);

    expect(find.byType(Column), findsWidgets);

    expect(find.byType(FancyShimmerCachedImage), findsWidgets);

    expect(find.text('Sample text'), findsOneWidget);

    expect(find.byType(Padding), findsNWidgets(3));

    expect(find.byType(ClipRRect), findsNWidgets(2));

    expect(find.byType(Stack), findsNWidgets(2));

    expect(find.byType(Positioned), findsOneWidget);

    expect(find.byType(SizedBox), findsNWidgets(5));

    expect(find.byType(VerticalSpace), findsOneWidget);

    expect(find.byType(Container), findsNWidgets(2));

    expect(find.byType(Positioned), findsOneWidget);

    expect(find.byType(Align), findsOneWidget);

    expect(find.byType(GestureDetector), findsOneWidget);

    expect(find.byType(CommonImageSlider), findsNothing);

  });
}
