import 'package:akdmvisitorsapp/common_widgets/ImageSliders/common_image_slider.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_section_title.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bluetooth_headset/bluetooth_headset_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/common_slider_image_bloc/common_image_slider_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/explore/attraction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:sizer/sizer.dart';

class MockBluetoothHeadsetBloc extends Mock implements BluetoothHeadsetBloc {}

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerSingleton<CommonImageSliderBloc>(CommonImageSliderBloc());
}


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

  final List<Details> contentList = [];
  late BluetoothHeadsetBloc bluetoothBloc;
  final List<String> imageList = [];
  Details? detailModel;

  setUp(() {
    bluetoothBloc = BluetoothHeadsetBloc();
    imageList.add("https://www.baps.org//Data/Sites/1/Media/LocationImages/932BAPS%20Shri%20Swaminarayan%20Mandir%20Chattanooga.jpg");
    imageList.add("https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/image_6483441.JPG");
    detailModel=Details(id: 1, images: imageList, order: 2, text: "Hello", videoUrl: "https://youtu.be/vjocAY-0fGQ");
  });


  Widget attractionPageWidget() {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<BluetoothHeadsetBloc>(
              create: (context) => bluetoothBloc,
            ),
          ],
          child: Sizer(builder: (context, orientation, deviceType) {
            return AttractionPage(content: detailModel);
          }),
        ),
      ),
    );
  }

  group('AttractionPage Widget Test', () {

    testWidgets('Renders AttractionPage correctly', (WidgetTester tester) async {

      await tester.pumpWidget(attractionPageWidget());
      // Add test expectations to verify widget rendering
      expect(find.byType(AttractionPage), findsOneWidget);

      expect(find.byType(FancyShimmerCachedImage), findsNWidgets(2));

      expect(find.byType(Stack), findsNWidgets(2));

      expect(find.byType(SizedBox), findsNWidgets(12));

      expect(find.byType(Container), findsNWidgets(10));

      expect(find.byType(Padding),  findsNWidgets(10));

      expect(find.byType(Positioned), findsOneWidget);

      expect(find.byType(CommonImageSlider), findsOneWidget);

      expect(find.byType(CustomSectionTitle), findsOneWidget);

      expect(find.byType(ClipRRect),  findsNWidgets(3));

      expect(find.text('HELLO'), findsOneWidget);

      expect(find.byType(SvgPicture), findsNothing);

      expect(find.byType(GestureDetector), findsNWidgets(4));

    });

  });
}
