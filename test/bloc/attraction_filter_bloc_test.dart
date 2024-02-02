import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/model/attraction/notification_message.dart';
import 'package:akdmvisitorsapp/model/hours.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_change_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_filter_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_state.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAppJsonRepository extends Mock implements AppJsonRepository {
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

void main() {
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


  group('AttractionFilterBloc', () {
    late AttractionFilterBloc attractionFilterBloc;
    late MockAppJsonRepository mockAppJsonRepository;
    Set<String?> attractionTypeList = <String?>{};
    late AppJsonModel appJsonData;

    setUp(() {
      attractionTypeList.add("Amenities"); //Parking
      mockAppJsonRepository = MockAppJsonRepository();
      attractionFilterBloc = AttractionFilterBloc(mockAppJsonRepository);
      appJsonData = AppJsonModel(attractions: <Attraction>[attractionList]);
    });

    blocTest<AttractionFilterBloc, AttractionState>(
      'emits the updated state when AttractionChangeEvent is added',
      build: () => attractionFilterBloc,
      act: (bloc) {
        // Add an AttractionChangeEvent to the bloc
        bloc.add(AttractionChangeEvent.tap(true,0,'Amenities',true));
      },
      expect: () {
        // Define the expected states here based on the AttractionChangeEvent
        final expectedAttractionList = appJsonData.attractions!.toList();
        final expectedAttractionTypeList = attractionTypeList;

        return [
          // Define the expected states based on the AttractionChangeEvent
          AttractionState(
            checked: true,
            value: 'Amenities',//Parking
            currentIndex: 0,
            attractionList: expectedAttractionList,
            isFiltering: true,
            attractionTypeList: expectedAttractionTypeList,
          ),
        ];
      },
    );

  });
}