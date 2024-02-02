import 'dart:convert';
import 'dart:io';

import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/news/news.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group(
    'Test case for Latest news model',
    () {
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
        file: '',
        description:
            'The auspicious occasions of Shri Swaminarayan Jayanti and Shri Ram Jayanti were celebrated across North America.',
        extraText: '',
        tags: newsTagList,
        categories: categoriesList,
        externalLink: 'https://google.com',
      );
      final latestNewsModelData = AppJsonModel(news: <News>[latestNewsModel]);
      //test for model json
      test(
        'News model should return correct JSON',
        () async {
          var dir = Directory.current.path;
          var jsonFilePath =
              File('$dir/test/json/latest_news_test.json').readAsStringSync();
          final Map<String, dynamic> jsonNewsMap = json.decode(jsonFilePath);
          final result = AppJsonModel.fromJson(jsonNewsMap);
          expect(result.news, latestNewsModelData.news);
        },
      );
      //test case for JSON map containing proper data
      test(
        'JSON map containing proper data',
        () async {
            final modelJSON = latestNewsModelData ;
            final expectedNewsJsonMap = {
              "news": [
                {
                  "title": "Shri Swaminarayan Jayanti & Ram Navmi Celebrations 2023",
                  "publishedAt": "April 1, 2023",
                  "author": "BAPS Robbinsville",
                  "thumbnail": "https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/webimages/SwaminarayanJayanti2023___12_.jpeg",
                  "heroImage": "https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/webimages/SwaminarayanJayanti2023___12_.jpeg",
                  "gallery": newsImagesGallery,
                  "file": "",
                  "description": "The auspicious occasions of Shri Swaminarayan Jayanti and Shri Ram Jayanti were celebrated across North America.",
                  "extraText": "",
                  "tags": newsTagList,
                  "categories": categoriesList,
                  "externalLink": "https://google.com"
                }
              ]
            };
            expect(modelJSON.news![0].toJson(), expectedNewsJsonMap['news']![0]);
        },
      );
    },
  );
}
