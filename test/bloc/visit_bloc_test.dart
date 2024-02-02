import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/model/attraction/notification_message.dart';
import 'package:akdmvisitorsapp/model/hours.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_service.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_state.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockVisitService extends Mock implements VisitService{
  @override
  Future<List<Attraction>> getAttractionList() async {
    List<Attraction> attractionList = [];
    var dir = Directory.current.path;
    var currentPath = File('$dir/test/json/attractions_test.json').readAsStringSync();
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
    var currentPath = File('$dir/test/json/attractions_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final List<dynamic> jsonList = jsonMap['attractions'];
    var mAttractionList = jsonList.map((jsonItem) => Attraction.fromJson(jsonItem)).toList();

    mAttractionList.removeWhere((element) => element.displayOrder?.visitPlanner == null);
    mAttractionList.sort((a,b){
      var aEL = a.displayOrder?.visitPlanner;
      var bEL = b.displayOrder?.visitPlanner;
      return (aEL ?? 0).compareTo((bEL ?? 0));
    });
    attractionList.addAll(mAttractionList);
    return Future(() => attractionList);
  }
}

class MockAppJsonRepository extends Mock implements AppJsonRepository{
  @override
  Future<AppJsonModel> loadJsonAssetData() async {
    var dir = Directory.current.path;
    var currentPath = File('$dir/test/json/read_all_app_file_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final jsonModel = AppJsonModel.fromJson(jsonMap);

    jsonModel.attractions?.removeWhere((element) => element.displayOrder?.visitPlanner == null);
    jsonModel.attractions?.sort((a,b){
      var aEL = a.displayOrder?.visitPlanner;
      var bEL = b.displayOrder?.visitPlanner;
      return (aEL ?? 0).compareTo((bEL ?? 0));
    });

    return jsonModel;
  }
}

class MockSharedPreferences extends Mock implements SharedPreferences {
  // Arrange: Set up the mock behavior for SharedPreferences.
  @override
  List<String>? getStringList(String key) {
    if (key == "keyAttractionListForPlanPref") {
      var dir = Directory.current.path;
      var fileContents = File('$dir/test/json/attractions_test.json').readAsStringSync();
      var jsonData = json.decode(fileContents);
      var jsonList = jsonData['attractions'];
      if (jsonList is List<dynamic>) {
        var stringList = jsonList.map((item) => json.encode(item)).toList();
        return stringList;
      }
    }
    return super.noSuchMethod(
      Invocation.method(#getStringList, [key]),
      returnValue: Future.value(null),
    ).await;
  }

}

GetIt sl = GetIt.instance;

Future<void> setupGetIt(MockVisitService mockVisitService,MockSharedPreferences mockSharedPreferences) async {
  sl.registerSingleton<VisitService>(mockVisitService);
  sl.registerSingleton<SharedPreferences>(mockSharedPreferences);
}

class MockBuildContext extends Mock implements BuildContext {}


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  final mockVisitService = MockVisitService();
  final mockSharedPreferences = MockSharedPreferences();
  final mockContext = MockBuildContext();
  setupGetIt(mockVisitService,mockSharedPreferences);

  List<String> imageList = [];
  imageList.add(
      "https://www.baps.org//Data/Sites/1/Media/LocationImages/932BAPS%20Shri%20Swaminarayan%20Mandir%20Chattanooga.jpg");
  imageList.add(
      "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/image_6483441.JPG");
  imageList.add(
      "https://www.baps.org//Data/Sites/1/Media/LocationImages/1387Milwaukee.jpg");
  imageList.add(
      "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/SAV%20Mandir_002.jpg");
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
  final attractionListData = <Attraction>[attractionList];

  group('VisitBloc', () {
    late VisitBloc visitBloc;
    late MockAppJsonRepository appJsonRepository;

    setUp((){
      appJsonRepository = MockAppJsonRepository();
      visitBloc = VisitBloc(appJsonRepository);
    });

      final expectedAttractionData = attractionListData;
      //when(mockVisitService.getAttractionList()).thenAnswer((_) async => attractionListData);
      //when(appJsonRepository.loadJsonAssetData()).thenAnswer((_) async => expectedAppJsonData);

    test('attractionList returns an empty list or not', () async {
      final result = await mockVisitService.getAttractionList();
      expect(result, isNotEmpty);
    });


      blocTest<VisitBloc, VisitState>('emits the expected state when VisitLoadEvent is added',
        setUp: () {
        },
        build: () => visitBloc,
        act: (bloc) => bloc.add(const VisitLoadEvent()),
        expect: () => [
          // Define your expected states here based on the provided data
          VisitState(
              attractionList:expectedAttractionData,
              attractionAddList: [], //expectedAttractionData to fail the case.
              totalHours: 1, //0 to fail the case.
              mainAttractionList: expectedAttractionData,
              isFiltering: true, //false to fail case.
              isExist: false),

        ],
      );


      blocTest<VisitBloc, VisitState>(
        'emits the expected state when VisitActivityLoadEvent is added',
        setUp: () {},
        build: () => visitBloc,
        act: (bloc) => bloc.add(const VisitActivityLoadEvent()),
        expect: () => [
          // Define your expected states here based on the provided data.
          VisitState(
              attractionList:expectedAttractionData,
              attractionAddList: expectedAttractionData,
              totalHours: 1,
              mainAttractionList: expectedAttractionData,
              isFiltering: true,
              isExist: false),
        ],
      );

    blocTest<VisitBloc, VisitState>(
      'emits the expected state when VisitRemoveItemEvent is added',
      setUp: () {},
      build: () => visitBloc,
      act: (bloc) => bloc.add(const VisitRemoveItemEvent(1)),
      expect: () => [
        // Define your expected states here based on the provided data.
        VisitState(
            attractionList:[],
            attractionAddList: [],
            totalHours: 0,
            mainAttractionList: expectedAttractionData,
            isFiltering: true,
            isExist: false),
      ],
    );

    blocTest<VisitBloc, VisitState>(
      'emits the expected state when VisitRemoveAllItemEvent is added',
      setUp: () {},
      build: () => visitBloc,
      act: (bloc) => bloc.add(const VisitRemoveAllEvent()),
      expect: () => [
        // Define your expected states here based on the provided data.
        VisitState(
            attractionList:[],
            attractionAddList: [],
            totalHours: 0,
            mainAttractionList: expectedAttractionData,
            isFiltering: true,
            isExist: false),
      ],
    );


    blocTest<VisitBloc, VisitState>(
      'visitAddActivityEvent adds attraction to the list',
      setUp: () {},
      build: () => visitBloc,
      act: (bloc) => bloc.add(VisitAddActivityEvent(attractionList, true, mockContext)
      ),

      expect: () => [
        // Define your expected states here based on the provided data.
        VisitState(
            attractionList:[],
            attractionAddList: [],
            totalHours: 0,
            mainAttractionList: expectedAttractionData,
            isFiltering: true,
            isExist: false),
      ],
    );

    tearDown((){
      visitBloc.close();
    });

    });

}
