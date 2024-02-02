import 'package:akdmvisitorsapp/common_widgets/ImageSliders/visit_image_slider.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_section_title.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/model/attraction/notification_message.dart';
import 'package:akdmvisitorsapp/model/hours.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/common_slider_image_bloc/common_image_slider_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/visit/attraction_screen.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
    getIt.registerSingleton<CommonImageSliderBloc>(CommonImageSliderBloc());
}

void main() {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupGetIt();

  List<String> imageList = [];
  imageList.add("https://www.baps.org//Data/Sites/1/Media/LocationImages/932BAPS%20Shri%20Swaminarayan%20Mandir%20Chattanooga.jpg");
  imageList.add("https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/image_6483441.JPG");

  //options data
  final optionsData = Options(reservable: false, isRecommended: true, externalLink: "url");
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


  Widget attractionScreenWidget(List<Attraction> attractionList) {
    attractionList.removeWhere((element) => (element.displayOrder?.exploreList == null || element.options!.isRecommended == false));
    attractionList.sort((a, b) => a.displayOrder!.exploreList
        .toString()
        .compareTo(b.displayOrder!.exploreList.toString()));

    return MaterialApp(
      home: Scaffold(
        body: Sizer(builder: (context, orientation, deviceType) {
          return AttractionsScreen(attractionList: attractionList,);
        }),
      ),
    );
  }


  testWidgets('AttractionsScreen shows data when loaded', (WidgetTester tester) async {
    // Pump the AttractionsScreen widget
    await tester.pumpWidget(attractionScreenWidget([attractionList]));

    // Wait for the widget to rebuild with the loaded state
    await tester.pump();

    expect(find.byType(AttractionsScreen), findsOneWidget);

    // Assertions for the loaded state
    expect(find.text(attractionDescription), findsOneWidget);

    expect(find.text(viewAllSmall), findsOneWidget);

    expect(find.byType(CustomSectionTitle), findsOneWidget);

    expect(find.byType(Padding), findsNWidgets(8));

    expect(find.byType(VerticalSpace), findsNWidgets(2));

    expect(find.byType(Column), findsNWidgets(3));

    expect(find.byType(Divider), findsOneWidget);

    expect(find.byType(CustomSectionTitle), findsOneWidget);

    expect(find.byType(CustomText), findsNWidgets(3));

    expect(find.byType(VisitImageSlider), findsOneWidget);

    expect(find.byType(GestureDetector), findsNWidgets(5));

    final gestureDetectorWidget = find.byType(GestureDetector);

    // Simulate a tap on the GestureDetector
    await tester.tap(gestureDetectorWidget);

    // Wait for the widget to rebuild after the tap
    await tester.pump();

    expect(find.byType(HomeBottomNavRoute), findsNWidgets);

  });

  testWidgets('AttractionsScreen shows empty state', (WidgetTester tester) async {

    await tester.pumpWidget(attractionScreenWidget([]));

    await tester.pump();

    // Assertions for the empty state
    expect(find.text(attractionDescription), findsNothing);

    expect(find.byType(VisitImageSlider), findsNothing);

  });
}