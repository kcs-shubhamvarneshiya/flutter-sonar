import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/accommodations/accommodations.dart';
import 'package:akdmvisitorsapp/model/announcements/announcements.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/model/campus/campus.dart';
import 'package:akdmvisitorsapp/model/campus_timing/campus_timing.dart';
import 'package:akdmvisitorsapp/model/event/events.dart';
import 'package:akdmvisitorsapp/model/feedback/feedback_form.dart';
import 'package:akdmvisitorsapp/model/feedback/submit_feedback.dart';
import 'package:akdmvisitorsapp/model/gallery/gallery.dart';
import 'package:akdmvisitorsapp/model/guidelines/guidelines.dart';
import 'package:akdmvisitorsapp/model/lookups/lookups.dart';
import 'package:akdmvisitorsapp/model/news/news.dart';
import 'package:akdmvisitorsapp/model/social_media/social_media.dart';
import 'package:akdmvisitorsapp/model/special_notices/spacial_notices.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:akdmvisitorsapp/model/hours.dart' as hours_campus;
import 'package:akdmvisitorsapp/model/event/events.dart' as time_event;

void main() {
  //this is test case file for full app json
  TestWidgetsFlutterBinding.ensureInitialized();
  //to Campus Model start
  //campus list
  final address = Address(
      street: "112 N Main St", city: "Windsor", state: "NJ", postal: "08561");
  //contact info list
  final List<ContactInfo> contactInfo = [
    ContactInfo(type: "tel", title: "Reception", value: "+1-609-918-1212")
  ];

  //to create the campus Model
  final campus = Campus(
    name: "Akshardham",
    description:
    "'Akshardham' means the divine abode of God. It is hailed as an eternal place of devotion, purity and peace. Swaminarayan Akshardham at Robbinsville, New Jersey, USA is a Mandir – an abode of God, a Hindu house of worship, and a spiritual and cultural campus dedicated to devotion, learning and harmony.",
    latitude: "40.2537234",
    longitude: "-74.5797675",
    address: address,
    contactInfo: contactInfo,
  );
  //to Campus Model End

  //galleries model start
  //media list

  final List<Media> mediaList = [];
  mediaList.add(
    Media(
      type: "IMAGE",
      name: "Tapomurti Shri Nilkanth Varni",
      captions:
      "This murti (sacred image) of Tapomurti Shri Nilkanth Varni is a homage to his travels around the Indian subcontinent for 7 years during his teenage years. Nilkanth Varni is portrayed in an ascetic pose performing tapas, or penance and worship with intense self-discipline",
      src:
      "https://media.baps.dev/wp-content/uploads/2021/10/15140152/05-Tapomurti-Nilkanth-Varni-Moods-scaled.jpg",
      thumbnail:
      "https://media.baps.dev/wp-content/uploads/2021/10/15140152/05-Tapomurti-Nilkanth-Varni-Moods-scaled.jpg",
    ),
  );

  //to create the galleries Model
  final galleries = Galleries(
    id: 0,
    title: "Homepage",
    description: "",
    media: mediaList,
  );
  //galleries model end

  /*final specialNotices = SpecialNotices(
    id: 0,
    title: "Homepage",
    description: "",
    video: ,
    audio:,
    image:"",
    details:[],
  );*/

  //final specialNotices = SpecialNotices();

  final List<hours_campus.Hours> campusHoursList = [
    hours_campus.Hours(
      startHour: 17.5,
      endHour: 17.75,
      weekday: 'Sunday',
    )
  ];

  //to create the campusTimings Model
  final campusTimings = CampusTimings(
    id: 0,
    name: "Visiting Hours",
    type: "OPEN",
    description: "Visiting Hours",
    hours: campusHoursList,
  );

  //Announcement model start
  //to create the Announcement Model
  final announcementList = Announcements(
      id: 1,
      priority: "WARNING",
      title: "New temple is in your area!",
      message: "New temple is in your area!",
      details: "asdf",
      thumbnail:
      "https://baps-visitor-app.s3.amazonaws.com/announcements/1686127068977_download.png",
      startTime: "2023-06-07T08:37:37.985Z",
      endTime: "2023-09-21T08:37:38.053Z");
  //Announcement model end

  //News model start
  //Add news gallery images list
  List<String> newsImagesGallery = [];
  newsImagesGallery.add(
      "https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/WebImages/SwaminarayanJayanti2023___1_.jpeg");
  newsImagesGallery.add(
      "https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/WebImages/SwaminarayanJayanti2023___2_.jpeg");
  newsImagesGallery.add(
      "https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/WebImages/SwaminarayanJayanti2023___3_.jpeg");
  // add news tags list
  List<String> newsTagList = [];
  newsTagList.add('Festivals');
  newsTagList.add('RamNavmi');
  // add news categories list
  List<String> categoriesList = [];
  newsTagList.add('CulturalPrograms');
  newsTagList.add('Sanyukt');

  // create model for latest news
  final latestNewsModel = News(
    title: 'Shri Swaminarayan Jayanti & Ram Navmi Celebrations 2023',
    publishedAt: 'April 1, 2023',
    author: 'BAPS Robbinsville',
    thumbnail:
    'https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/webimages/SwaminarayanJayanti2023___12_.jpeg',
    heroImage:
    'https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/webimages/SwaminarayanJayanti2023___12_.jpeg',
    gallery: newsImagesGallery,
    file: 'url',
    description:
    'The auspicious occasions of Shri Swaminarayan Jayanti and Shri Ram Jayanti were celebrated across North America.',
    extraText: '',
    tags: newsTagList,
    categories: categoriesList,
    externalLink: 'https://google.com',
  );
  //News model end

  //Events model start
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
  final List<time_event.Timings> campusTiming = [
    time_event.Timings(
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
  );
  //Events model end
//Attraction model start
  //image list
  List<String> attractionImageList = [];
  attractionImageList.add(
      "https://www.baps.org//Data/Sites/1/Media/LocationImages/932BAPS%20Shri%20Swaminarayan%20Mandir%20Chattanooga.jpg");
  attractionImageList.add(
      "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/image_6483441.JPG");
  attractionImageList.add(
      "https://www.baps.org//Data/Sites/1/Media/LocationImages/1387Milwaukee.jpg");
  attractionImageList.add(
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
    images: attractionImageList,
    type: "Outdoor Attraction",
    duration: '1',
    options: optionsData,
    displayOrder: displayOrderData,
    longitude: "72.49889",
    latitude: "23.11222",
    mapIcon: "Glow Garden",
    attractionType: "Amenities",
    beacon: beaconData,
  );

//Attraction model end

  //Social Media model start
  //to create the Social media Model
  final socialMedia = SocialMedia(
      type: "FACEBOOK",
      link: "https://caiosdf.com",
      handle: "asdf",
      date: "2023-06-06T18:30:00.000Z",
      description: "asdf",
      thumbnail:
      "https://baps-visitor-app.s3.amazonaws.com/socialMedia/1686127091054_images.jpg",
      profileImage:
      "https://baps-visitor-app.s3.amazonaws.com/socialMedia/1686127092396_insta.jpg");
  //Social Media model end

  //Lookups model start
  final lookUpList = Lookups(
    aboutUs: "https://www.baps.org/About-BAPS.aspx",
    donate: "https://donate.na.baps.org/robbinsville",
    visitorGuidelines:
    "https://www.baps.org/Global-Network/North-America/Robbinsville/Visitor-Info.aspx",
    glossary: "https://www.baps.org/glossary.aspx",
    privacyPolicy: "https://www.baps.org/Privacy-Policy.aspx",
    termsConditions: "https://www.baps.org/Terms-and-Conditions.aspx",
    socialYoutubeLink: "https://www.youtube.com/c/PSM100yrs/featured",
    socialInstagramLink: "https://www.instagram.com/psm100yrs",
    socialFacebookLink: "https://www.facebook.com/psm100yrs",
    socialTwitterLink: "https://twitter.com/psm100yrs",
    uberDeeplink: "https://m.uber.com/ul/?client_id=gbjhdsfjhhku25sd",
    lyftDeeplink: "https://www.lyft.com/",
  );
  //Lookups model end

  //Guideline model start
  //to create the Guidelines Model
  final guidLineData = Guidelines(
      image:
      "https://upload.wikimedia.org/wikipedia/commons/7/77/Akshardham_Gandhinagar_Gujarat.jpg",
      description:
      "During your visit, we kindly ask you be respectful of fellow visitors and the campus. See our full list of visitor guidelines to learn more.",
      link: "https://www.baps.org/Terms-and-Conditions.aspx");
  //Guideline model end
  //Accommodation model start
  final accommodationModel = Accommodations(
    id: 40,
    name: "BAPS Swaminarayan Chhatralaya-1",
    location: "Adipur -1",
    price: 400,
    link: "https://www.baps.org/Terms-and-Conditions.aspx",
    thumbnail:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/BAPS_Mandir_Chino_Hills.jpg/1280px-BAPS_Mandir_Chino_Hills.jpg",
  );
  //Accommodation model end

  //Feedback from model start
  //options list model
  List<FeedbackOptions> optionsListModel = [
    FeedbackOptions(
      key: 'male',
      value: 'Male',
    ),
  ];
  //fields list model
  List<Fields> fieldModelList = [
    Fields(
      options: optionsListModel,
      required: true,
      fieldName: 'Gender',
      fieldType: 'radio',
    )
  ];
  final feedbackFormModel = FeedbackForm(
    submitLink: 'http://www.rysun.com',
    fields: fieldModelList,
  );
  //Feedback from model end

  List<Record> recordList = [
    Record(
        fieldName:'Name',
        fieldValue:'lorem'
    )
  ];

  final submitFeedback = SubmitFeedback(record: recordList);
// Convert the campus object to a JSON map

  final readAppJsonModel = AppJsonModel(
      campus: campus,
      galleries: [galleries],
      specialNotices:[],//[specialNotices]
      campusTimings: [campusTimings],
      announcements: [announcementList],
      news: [latestNewsModel],
      events: [eventModel],
      attractions: [attractionList],
      socialMedia: [socialMedia],
      lookups: lookUpList,
      guidelines: guidLineData,
      accommodations: [accommodationModel],
      feedbackForm: feedbackFormModel,
      submitFeedback:submitFeedback
  );

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath =
      File('$dir/test/json/read_all_app_file_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      // act
      final result = AppJsonModel.fromJson(jsonMap);
      // assert
      expect(result.toJson(), readAppJsonModel.toJson());
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = readAppJsonModel;
      // assert
      final expectedJsonMap = {
        "campus": {
          "name": "Akshardham",
          "description":
          "'Akshardham' means the divine abode of God. It is hailed as an eternal place of devotion, purity and peace. Swaminarayan Akshardham at Robbinsville, New Jersey, USA is a Mandir – an abode of God, a Hindu house of worship, and a spiritual and cultural campus dedicated to devotion, learning and harmony.",
          "latitude": "40.2537234",
          "longitude": "-74.5797675",
          "address": address,
          "contactInfo":contactInfo,
        },
        "specialNotices":[],
        "campusTimings": [
          {
            "description": "Visiting Hours",
            "hours": [
              {"endHour": 17.5, "startHour":17.75, "weekday": "Wed-Mon"}
            ],
            "id": 0,
            "name": "Visiting Hours",
            "type": "OPEN"
          }
        ],
        "galleries": [
          {
            "id": 0,
            "title": "Homepage",
            "description": "",
            "media":mediaList
          }
        ],
        "announcements": [
          {
            "id": 1,
            "priority": "WARNING",
            "title": "New temple is in your area!",
            "message": "New temple is in your area!",
            "details": "asdf",
            "thumbnail":
            "https://baps-visitor-app.s3.amazonaws.com/announcements/1686127068977_download.png",
            "startTime": "2023-06-07T08:37:37.985Z",
            "endTime": "2023-09-21T08:37:38.053Z"
          }
        ],
        "news": [
          {
            "title": "Shri Swaminarayan Jayanti & Ram Navmi Celebrations 2023",
            "publishedAt": "April 1, 2023",
            "author": "BAPS Robbinsville",
            "thumbnail":
            "https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/webimages/SwaminarayanJayanti2023___12_.jpeg",
            "heroImage":
            "https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/webimages/SwaminarayanJayanti2023___12_.jpeg",
            "gallery": [
              "https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/WebImages/SwaminarayanJayanti2023___1_.jpeg",
              "https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/WebImages/SwaminarayanJayanti2023___2_.jpeg",
              "https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/WebImages/SwaminarayanJayanti2023___3_.jpeg"
            ],
            "file": "url",
            "description":
            "The auspicious occasions of Shri Swaminarayan Jayanti and Shri Ram Jayanti were celebrated across North America.",
            "extraText": "",
            "tags": ["Festivals", "RamNavmi"],
            "categories": ["CulturalPrograms", "Sanyukt"],
            "externalLink": "https://google.com"
          }
        ],
        "events": [
          {
            "title": "Abhishek",
            "description":
            "Abhishek is the ancient Hindu practice of pouring water over the sacred image of God to honour him and to attain his blessings. It is also an opportunity for devotees to pray to God, asking him to cleanse one’s soul.",
            "timings": [
              {
                "name": "Abhishek Timings",
                "description":
                "Devotees will be able to take part in a traditional abhishek ceremony with sanskrit hymns at the following times",
                "type": "OPEN",
                "hours": [
                  {"weekday": "Sunday", "startHour": 17.5, "endHour": 17.75}
                ]
              }
            ],
            "thumbnail":
            "https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_53.jpg",
            "images": [
              "https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_53.jpg",
              "https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_50.jpg",
              "https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_47.jpg",
              "https://www.baps.org/Data/Sites/1/Media/GalleryImages/14521/WebImages/Robbinsville_GMAMP_48.jpg"
            ],
            "type": "IMAGE"
          }
        ],
        "attractions": [
          {
            "id": 1,
            "title": "Parking A",
            "description":
            "Parking area for all visitors to the BAPS Swaminarayan Akshardham in New Jersey",
            "thumbnail":
            "https://www.baps.org/Data/Sites/1/Media/LocationImages/rbvdirections-1.jpg",
            "heroImage":
            "https://www.baps.org/Data/Sites/1/Media/LocationImages/rbvdirections-1.jpg",
            "images": [
              "https://www.baps.org//Data/Sites/1/Media/LocationImages/932BAPS%20Shri%20Swaminarayan%20Mandir%20Chattanooga.jpg",
              "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/image_6483441.JPG",
              "https://www.baps.org//Data/Sites/1/Media/LocationImages/1387Milwaukee.jpg",
              "https://www.baps.org/Data/Sites/1/Media/ModuleRotatorImages/SAV%20Mandir_002.jpg"
            ],
            "type": "Outdoor Attraction",
            "duration": "1",
            "options": {
              "reservable": false,
              "isRecommended": true,
              "externalLink": "url"
            },
            "displayOrder": {"exploreList": 2, "visitPlanner": 4},
            "longitude": "72.49889",
            "latitude": "23.11222",
            "mapIcon": "Glow Garden",
            "attractionType": "Amenities",
            "beacon": {
              "id": "35eb0f3c-aa6b-4f23-bfb0-fb63d05a0536",
              "major": 1,
              "minor": 1
            }
          }
        ],
        "socialMedia": [
          {
            "type": "FACEBOOK",
            "link": "https://caiosdf.com",
            "handle": "asdf",
            "date": "2023-06-06T18:30:00.000Z",
            "description": "asdf",
            "thumbnail":
            "https://baps-visitor-app.s3.amazonaws.com/socialMedia/1686127091054_images.jpg",
            "profileImage":
            "https://baps-visitor-app.s3.amazonaws.com/socialMedia/1686127092396_insta.jpg"
          }
        ],
        "lookups": {
          "aboutUs": "https://www.baps.org/About-BAPS.aspx",
          "donate": "https://donate.na.baps.org/robbinsville",
          "visitorGuidelines":
          "https://www.baps.org/Global-Network/North-America/Robbinsville/Visitor-Info.aspx",
          "glossary": "https://www.baps.org/glossary.aspx",
          "privacyPolicy": "https://www.baps.org/Privacy-Policy.aspx",
          "termsConditions": "https://www.baps.org/Terms-and-Conditions.aspx",
          "socialYoutubeLink": "https://www.youtube.com/c/PSM100yrs/featured",
          "socialInstagramLink": "https://www.instagram.com/psm100yrs",
          "socialFacebookLink": "https://www.facebook.com/psm100yrs",
          "socialTwitterLink": "https://twitter.com/psm100yrs",
          "uberDeeplink": "https://m.uber.com/ul/?client_id=gbjhdsfjhhku25sd",
          "lyftDeeplink": "https://www.lyft.com/"
        },
        "guidelines": {
          "image":
          "https://upload.wikimedia.org/wikipedia/commons/7/77/Akshardham_Gandhinagar_Gujarat.jpg",
          "description":
          "During your visit, we kindly ask you be respectful of fellow visitors and the campus. See our full list of visitor guidelines to learn more.",
          "link": "https://www.baps.org/Terms-and-Conditions.aspx"
        },
        "accommodations": [
          {
            "id": 40,
            "name": "BAPS Swaminarayan Chhatralaya-1",
            "location": "Adipur -1",
            "price": 400,
            "link": "https://www.baps.org/Terms-and-Conditions.aspx",
            "thumbnail":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/BAPS_Mandir_Chino_Hills.jpg/1280px-BAPS_Mandir_Chino_Hills.jpg"
          }
        ],
        "feedbackForm": {
          "submitLink": "http://www.rysun.com",
          "fields": [
            {
              "options": [
                {"key": "male", "value": "Male"}
              ],
              "required": true,
              "fieldName": "Gender",
              "fieldType": "radio"
            }
          ]
        },
        "submitFeedback":{
          "record": [
            {
              "fieldName": "Name",
              "fieldValue": "lorem"
            }
          ],
        }
      };

      expect(result.toJson(), equals(expectedJsonMap));
    });
  });

}
