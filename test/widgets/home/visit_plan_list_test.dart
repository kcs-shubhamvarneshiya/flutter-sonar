import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_section_title.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/model/attraction/notification_message.dart';
import 'package:akdmvisitorsapp/model/hours.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_service.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_state.dart';
import 'package:akdmvisitorsapp/presentaion/home/visit_plan_list.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';


class MockVisitBloc extends Mock implements VisitBloc {
  Stream<VisitState> get State => Stream.value(VisitState(attractionList:[
    Attraction(id: 1, isAddedInPlan: true),
    Attraction(id: 2, isAddedInPlan: true),
  ], attractionAddList: [], totalHours: 0, mainAttractionList: [], isFiltering: false, isExist: false));

  @override
  void dispose() {}
}

class MockAttractionsSection extends StatelessWidget {
  const MockAttractionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(); // You can customize this mock as needed for testing.
  }
}


class MockVisitService extends Mock implements VisitService {
  @override
  Future<List<Attraction>> getAttractionList() async {
    List<Attraction> attractionList = [];
    var dir = Directory.current.path;
    var currentPath =
    File('$dir/test/json/attractions_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final List<dynamic> jsonList = jsonMap['attractions'];
    var mList = jsonList.map((jsonItem) => Attraction.fromJson(jsonItem)).toList();
    attractionList.addAll(mList);
    return Future(() => attractionList);
  }

  @override
  Future<List<Attraction>> getFilterAttractionList() async {
    List<Attraction> attractionList = [];
    var dir = Directory.current.path;
    var currentPath =
    File('$dir/test/json/attractions_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final List<dynamic> jsonList = jsonMap['attractions'];
    var mAttractionList =
    jsonList.map((jsonItem) => Attraction.fromJson(jsonItem)).toList();

    mAttractionList
        .removeWhere((element) => element.displayOrder?.visitPlanner == null);
    mAttractionList.sort((a, b) {
      var aEL = a.displayOrder?.visitPlanner;
      var bEL = b.displayOrder?.visitPlanner;
      return (aEL ?? 0).compareTo((bEL ?? 0));
    });
    attractionList.addAll(mAttractionList);
    return Future(() => attractionList);
  }
}

class MockSharedPreferences extends Mock implements SharedPreferences {
  // Arrange: Set up the mock behavior for SharedPreferences.
  @override
  List<String>? getStringList(String key) {
    if (key == "keyAttractionListForPlanPref") {
      var dir = Directory.current.path;
      var fileContents =
      File('$dir/test/json/attractions_test.json').readAsStringSync();
      var jsonData = json.decode(fileContents);
      var jsonList = jsonData['attractions'];
      if (jsonList is List<dynamic>) {
        var stringList = jsonList.map((item) => json.encode(item)).toList();
        return stringList;
      }
    }
  }
}

class MockAppJsonRepository extends Mock implements AppJsonRepository {
  @override
  Future<AppJsonModel> loadJsonAssetData() async {
    var dir = Directory.current.path;
    var currentPath =
    File('$dir/test/json/read_all_app_file_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final jsonModel = AppJsonModel.fromJson(jsonMap);

    jsonModel.attractions
        ?.removeWhere((element) => element.displayOrder?.visitPlanner == null);
    jsonModel.attractions?.sort((a, b) {
      var aEL = a.displayOrder?.visitPlanner;
      var bEL = b.displayOrder?.visitPlanner;
      return (aEL ?? 0).compareTo((bEL ?? 0));
    });

    return jsonModel;
  }
}

final getIt = GetIt.instance;

Future<void> setupLocator(MockAppJsonRepository mockAppJsonRepository, MockVisitService mockVisitService, MockSharedPreferences mockSharedPreferences ) async {
  getIt.registerSingleton<AppJsonRepository>(mockAppJsonRepository);
  getIt.registerSingleton<VisitService>(mockVisitService);
  getIt.registerSingleton<SharedPreferences>(mockSharedPreferences);
  getIt.registerSingleton<VisitBloc>(VisitBloc(mockAppJsonRepository));
}


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockAppJsonRepository=MockAppJsonRepository();
  final mockVisitService=MockVisitService();
  final mockSharedPreferences=MockSharedPreferences();
  setupLocator(mockAppJsonRepository,mockVisitService,mockSharedPreferences);
  //final mockVisitBloc = MockVisitBloc();
  //final visitBloc = VisitBloc(getIt());
  late VisitBloc visitBloc;

  setUp(() {
    visitBloc = VisitBloc(getIt());
    visitBloc.add(const VisitEvent.loadVisitEvent());
  });

  final ScrollController scrollController = ScrollController();
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
      description:"Parking area for all visitors to the BAPS Swaminarayan Akshardham in New Jersey",
      thumbnail:"https://www.baps.org/Data/Sites/1/Media/LocationImages/rbvdirections-1.jpg",
      heroImage:"https://www.baps.org/Data/Sites/1/Media/LocationImages/rbvdirections-1.jpg",
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
      isAddedInPlan:true,
      timings:attractionTiming
  );

  Widget visitPlanListWidget(List<Attraction> filterList) {
    return MaterialApp(
      home: Scaffold(
        body: Sizer(
          builder: (context, orientation, deviceType) {
            filterList;
            return BlocProvider<VisitBloc>(
              create: (context) => visitBloc,
              child: PlanMyVisitList(),
            );
              }
            ),
        ),
      );
  }


  group('PlanMyVisitList Widget Test', () {

    testWidgets('should render correctly when there are no attractions in the plan', (WidgetTester tester) async {
      var filterList = [attractionList]
          .where((element) => element.isAddedInPlan = true)
          .toList();

      // Act
      await tester.pumpWidget(visitPlanListWidget(filterList));

      // Assert
      expect(find.byType(PlanMyVisitList), findsOneWidget);

      expect(find.byType(CustomSectionTitle), findsOneWidget);

      expect(find.byType(Container), findsNWidgets(3));

      expect(find.byType(CustomText), findsNWidgets(2));

      expect(find.byType(ButtonIcon), findsOneWidget);

      //expect(find.byWidget(AttractionsSection(attractionList: filterList,scrollController: scrollController)), findsOneWidget);

      expect(find.byType(DecoratedBox), findsNWidgets(2));

      /*expect(find.byType(RawScrollbar), findsOneWidget);

      expect(find.text(viewMyPlan), findsOneWidget);

      expect(find.text(dummyPlanText), findsOneWidget);*/

      expect(find.text(startvisit), findsOneWidget);

      expect(find.text(planyourVisit), findsOneWidget);

      expect(find.byType(SizedBox), findsNWidgets(11));

      expect(find.byType(Padding), findsNWidgets(7));

      expect(find.byType(Center), findsNWidgets(2));

      expect(find.byType(Column), findsNWidgets(2));

    });


  });
}