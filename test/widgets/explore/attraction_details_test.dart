import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/ImageSliders/common_image_slider.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/model/attraction/notification_message.dart';
import 'package:akdmvisitorsapp/model/hours.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bluetooth_headset/bluetooth_headset_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/common_slider_image_bloc/common_image_slider_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/explore/attraction_details.dart';
import 'package:akdmvisitorsapp/presentaion/explore/attraction_page.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerSingleton<CommonImageSliderBloc>(CommonImageSliderBloc());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

  File getProjectFile(String path) {
    final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS']!;
    return File('$assetFolderPath/$path');
  }

  late BluetoothHeadsetBloc bluetoothBloc;

  setUp(() {
    bluetoothBloc = BluetoothHeadsetBloc();
    //attractionFilterBloc.add(AttractionChangeEvent.tap(false, 0, '',true));
  });

  List<String> imageList = [];
  imageList.add("https://www.baps.org//Data/Sites/1/Media/LocationImages/932BAPS%20Shri%20Swaminarayan%20Mandir%20Chattanooga.jpg");
  imageList.add("https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/image_6483441.JPG");

  //options data
  final optionsData =
      Options(reservable: false, isRecommended: true, externalLink: "url");
  //display order data
  final displayOrderData = DisplayOrder(exploreList: 2, visitPlanner: 4);
  //beacons data
  final beaconData = Beacons(
    id: '35eb0f3c-aa6b-4f23-bfb0-fb63d05a0536',
    major: 1,
    minor: 1,
  );
  final notificationMessage = NotificationMessage(
    body: "test notification",
    title: "test",
    deepLink: "http://abc.com",
  );

  final List<Hours> hoursList = [
    Hours(
      startHour: 17.5,
      endHour: 17.75,
      weekday: 'Sunday',
    )
  ];
  // create model for timing
  final List<Timings> attractionTiming = [
    Timings(
      name: 'Abhishek Timings',
      description: 'Devotees will be able to take part in a traditional abhishek ceremony with sanskrit hymns at the following times',
      type: 'OPEN',
      hours: hoursList,
    )
  ];

  final List<Details> contentList = [];
  contentList.add(Details(id: 1, images: imageList, order: 2, text: "Hello", videoUrl: "http://abc.com"));
  contentList.add(Details(id: 2, images: imageList, order: 2, text: "Welcome to Campus", videoUrl: "http://xyz.com"));

  //to create the Attraction Model
  final attractionList = Attraction(
      id: 1,
      title: "Parking A",
      description: "Parking area for all visitors to the BAPS Swaminarayan Akshardham in New Jersey",
      thumbnail: "https://www.baps.org/Data/Sites/1/Media/LocationImages/rbvdirections-1.jpg",
      heroImage: "https://www.baps.org/Data/Sites/1/Media/LocationImages/rbvdirections-1.jpg",
      images: imageList,
      type: "Outdoor Attraction",
      duration: '1',
      options: optionsData,
      displayOrder: displayOrderData,
      longitude: "72.49889",
      latitude: "23.11222",
      radius: 1,
      averageVisitLengthInMinutes: 1,
      mapIcon: "Glow Garden",
      attractionType: "Amenities",
      beacon: beaconData,
      notificationMessage: notificationMessage,
      content: contentList,
      isAddedInPlan: false,
      timings: attractionTiming);

  Widget attractionDetailWidget() {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<BluetoothHeadsetBloc>(
              create: (context) => bluetoothBloc,
            ),
          ],
          child: Sizer(builder: (context, orientation, deviceType) {
            return AttractionDetails(
              appJsonModel: [attractionList],
              isDeeplink: false,
            );
          }),
        ),
      ),
    );
  }

  group('AttractionDetails Widget Test', () {

    testWidgets('Renders AttractionDetails correctly', (WidgetTester tester) async {

      await tester.pumpWidget(attractionDetailWidget());

      expect(find.byType(AttractionDetails), findsOneWidget);

      expect(find.byType(SingleChildScrollView), findsNWidgets(3));

      expect(find.byType(CommonImageSlider), findsNWidgets(3));

      expect(find.byType(ReadMoreText), findsOneWidget);

      expect(find.text('Parking area for all visitors to the BAPS Swaminarayan Akshardham in New Jersey'), findsOneWidget);

      expect(find.byType(ListView), findsNWidgets(3));

      expect(find.byType(DayTimeWidget), findsOneWidget);

      expect(find.byType(AttractionPage), findsNWidgets(2));

      expect(find.byType(ReadMoreText), findsOneWidget);

      expect(find.byType(CustomText), findsNWidgets(6));

      expect(find.byType(Column), findsNWidgets(11));

      expect(find.byType(Container), findsNWidgets(32));

      expect(find.byType(GestureDetector), findsNWidgets(14));

      expect(find.byType(SizedBox), findsNWidgets(47));

      expect(find.byType(ButtonIcon), findsOneWidget);

      expect(find.byType(Expanded), findsOneWidget);

      expect(find.byType(HorizontalSpace), findsNWidgets(7));

      expect(find.byType(SvgPicture), findsNWidgets(2));

      var pathShareIcon  = IconPaths.shareIconButton;
      final cancelIcon = getProjectFile(pathShareIcon).existsSync();
      expect(cancelIcon, isTrue, reason: '$pathShareIcon does not exist');

    });
  });
}
