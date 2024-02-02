import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/model/attraction/notification_message.dart';
import 'package:akdmvisitorsapp/model/hours.dart';
import 'package:akdmvisitorsapp/presentaion/home/attractions_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  setUp(() {});
  TestWidgetsFlutterBinding.ensureInitialized();

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
    title:"test",
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
      description:
      'Devotees will be able to take part in a traditional abhishek ceremony with sanskrit hymns at the following times',
      type: 'OPEN',
      hours: hoursList,
    )
  ];
  final List<Details> contentList=[];
  contentList.add(Details(id: 1,images: imageList,order: 2,text: "Hello",videoUrl: "http://abc.com"));
  //to create the Attraction Model
  final attractionList = Attraction(
      id: 1,
      title: "Parking A",
      description:
      "Parking area for all visitors to the BAPS Swaminarayan Akshardham in New Jersey",
      thumbnail:
      "https://www.baps.org/Data/Sites/1/Media/LocationImages/rbvdirections-1.jpg",
      heroImage:
      "https://www.baps.org/Data/Sites/1/Media/LocationImages/rbvdirections-1.jpg",
      images: imageList,
      type: "Outdoor Attraction",
      duration: '1',
      options: optionsData,
      displayOrder: displayOrderData,
      longitude: "72.49889",
      latitude: "23.11222",
      radius:1,
      averageVisitLengthInMinutes:1,
      mapIcon: "Glow Garden",
      attractionType: "Amenities",
      beacon: beaconData,
      notificationMessage: notificationMessage,
      content:contentList,
      isAddedInPlan:false,
      timings:attractionTiming
  );

  group('Home attraction widget', () {
    //Build the AttractionsSection widget
    final scrollController = ScrollController();
    Widget attractionWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return AttractionsSection(attractionList: <Attraction>[attractionList], // Replace with your data
              scrollController: scrollController,);
          },
        ),
      );
    }

    // attraction widget test case
    testWidgets('Attraction List ', (WidgetTester tester) async {
      await tester.pumpWidget(attractionWidget());

      final listView = find.byType(ListView);
      final shimmerImage = find.byType(FancyShimmerCachedImage);
      final customText = find.byType(CustomText);

      //Verify that the ListView and other widgets are found
      expect(listView, findsOneWidget);
      expect(shimmerImage, findsWidgets);
      expect(customText, findsWidgets);

      //Example assertion: Check if the ListView has a horizontal scroll physics
      final listViewWidget = tester.widget<ListView>(listView);
      expect(listViewWidget.physics, isA<BouncingScrollPhysics>());

    });
  });
}