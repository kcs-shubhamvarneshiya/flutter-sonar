import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/event/events.dart';
import 'package:akdmvisitorsapp/presentaion/home/upcoming_events.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  List<String> imageList = [];
  imageList.add("https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_53.jpg");
  imageList.add("https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_50.jpg");

  //create hours list in events
  final List<Hours> eventsHoursList = [
    Hours(
      startHour: 17.5,
      endHour: 17.75,
      weekday: 'Sunday',
    )
  ];
  // create model for timing
  final List<Timings> campusTiming = [
    Timings(
      name: 'Abhishek Timings',
      description:
      'Devotees will be able to take part in a traditional abhishek ceremony with sanskrit hymns at the following times',
      type: 'OPEN',
      hours: eventsHoursList,
    )
  ];

  final eventModel = Events(
      title: "Abhishek",
      description:"Abhishek is the ancient Hindu practice of pouring water over the sacred image of God to honour him and to attain his blessings.",
      timings: campusTiming,
      thumbnail: "https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_53.jpg",
      images: imageList,
      type: "IMAGE",
      externalLink: "https://www.baps.org/About-BAPS.aspx",
      eventDate: "2023-12-30T16:46:00.000Z"
  );

  testWidgets('UpcomingEvents widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    var filteredEventList = [eventModel].where((element) {
      var endTime = DateTime.parse(element.eventDate.toString());
      return endTime.isAfter(DateTime.now());
    }).toList();

    await tester.pumpWidget(
        MaterialApp(
      home: Scaffold(
        body: Sizer(builder: (context, orientation, deviceType) {
          return UpcomingEvents(
            events: List<Events>.generate(1,
                  (index) => filteredEventList[0],
            ),
          );
          }
        ),
      ),
    ));

    await tester.pump();

    // Check if the widget is displayed correctly
    expect(find.text('Abhishek'), findsOneWidget);

    expect(find.text('View more'), findsOneWidget);

    expect(find.byType(FancyShimmerCachedImage), findsNWidgets(1));

    final customText = find.byType(CustomText);
    expect(customText, findsNWidgets(4));

    final listView = find.byType(ListView);
    expect(listView, findsOneWidget);

    final listViewWidget = tester.widget<ListView>(listView);
    expect(listViewWidget.physics, isA<BouncingScrollPhysics>());

    expect(find.byType(RawScrollbar), findsWidgets);

    expect(find.byType(Column), findsWidgets);

    expect(find.byType(CustomText), findsWidgets);

    expect(find.byType(Row), findsWidgets);

    expect(find.byType(SizedBox), findsWidgets);

    expect(find.byType(VerticalSpace), findsNWidgets(5));

    expect(find.byType(Container), findsWidgets);

    //await tester.tap(find.text('View more'));

  });
}