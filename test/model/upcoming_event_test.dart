import 'dart:convert';
import 'dart:io';

import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/event/events.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //to create the images list for upcoming events
  List<String> imageList = [];
  imageList.add(
      "https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_53.jpg");
  imageList.add(
      "https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_50.jpg");
  imageList.add(
      "https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_47.jpg");
  imageList.add(
      "https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_48.jpg");
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
    description:
        "Abhishek is the ancient Hindu practice of pouring water over the sacred image of God to honour him and to attain his blessings. It is also an opportunity for devotees to pray to God, asking him to cleanse one’s soul.",
    timings: campusTiming,
    thumbnail:
        "https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_53.jpg",
    images: imageList,
    type: "IMAGE",
    externalLink: "https://www.baps.org/About-BAPS.aspx",
    eventDate: "2023-10-16T16:46:00.000Z"
  );

  final eventModelList = AppJsonModel(events: <Events>[eventModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath =
          File('$dir/test/json/upcoming_event_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      // act
      final result = AppJsonModel.fromJson(jsonMap);
      // assert
      expect(result.events , eventModelList.events );
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = eventModelList;
      // assert

      final expectedJsonMap = {
        "events": [
          {
            "title": "Abhishek",
            "timings": campusTiming,
            "description":
                "Abhishek is the ancient Hindu practice of pouring water over the sacred image of God to honour him and to attain his blessings. It is also an opportunity for devotees to pray to God, asking him to cleanse one’s soul.",
            "thumbnail":
                "https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_53.jpg",
            "images": imageList,
            "type": "IMAGE",
            "externalLink": "https://www.baps.org/About-BAPS.aspx",
            "eventDate":"2023-10-16T16:46:00.000Z"
          }
        ]
      };
      expect(result.events![0].toJson(), expectedJsonMap['events']![0]);
    });
  });
}
