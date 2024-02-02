import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/model/news/news.dart';
import 'package:akdmvisitorsapp/presentaion/home/latest_news.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:sizer/sizer.dart';

/*void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Latest News', () {
    // network image widget
    Widget networkImage() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FadeInImage(
          image: NetworkImage(
              'https://media.baps.dev/wp-content/uploads/2021/10/15140152/05-Tapomurti-Nilkanth-Varni-Moods-scaled.jpg'),
          placeholder: AssetImage(IconPaths.placeholderImage),
          fit: BoxFit.cover,
        ),
      );
    }

    // announcement list widget
    Widget latestNewsSection() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(height: 1.0.h),

                //News Lists
                Container(
                  margin: EdgeInsets.zero,
                  height: MediaQuery.of(context).size.height * .41,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 2.h),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 1.5.h),
                        child: Container(
                          width: 65.w,
                          padding: EdgeInsets.all(1.h),
                          decoration: BoxDecoration(
                            color: ColorPath.announcementContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 22.h,
                                  width: 55.w,
                                  margin: EdgeInsets.fromLTRB(
                                      1.5.h, 1.0.h, 1.5.h, 1.0.h),
                                  child: networkImage(),
                                ),
                                VerticalSpace(height: 1.h),
                                //News Date
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.5.h),
                                  child: CustomText(
                                    text: date,
                                    fontSize: 12.sp,
                                    underline: false,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: addingTonFont,
                                    fontWeight: FontWeight.normal,
                                    color: ColorPath.headerBgContainer,
                                    maxLine: 1,
                                    align: TextAlign.start,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                VerticalSpace(height: 1.h),
                                //Announcements Title
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.5.h),
                                  child: CustomText(
                                    text: latestNews,
                                    fontSize: 14.sp,
                                    underline: false,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: interFont,
                                    fontWeight: FontWeight.w300,
                                    color: ColorPath.whiteColor,
                                    maxLine: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    Widget pushAllLatestNewsScreen() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return GestureDetector(
              onTap: () {
                getIt<AppRouter>().push(LatestNewsItemsRoute());
              },
              child: CustomText(
                text: viewMore,
                fontSize: 10.sp,
                underline: false,
                fontFamily: interFont,
                fontWeight: FontWeight.w400,
                color: ColorPath.redColor,
              ),
            );
          },
        ),
      );
    }

    testWidgets('open all latest news screen', (tester) async {
      await tester.pumpWidget(pushAllLatestNewsScreen());
      expect(find.byType(GestureDetector), findsOneWidget);
    });

// network image widget test case
    testWidgets(
      'should properly mock Image.network and not crash',
      (WidgetTester tester) async {
        mockNetworkImagesFor(() => tester.pumpWidget(networkImage()));
      },
    );
    // announcement widget test case
    testWidgets('News Section ', (WidgetTester tester) async {
      await tester.pumpWidget(latestNewsSection());
      expect(find.byType(CustomText), findsWidgets);
      expect(find.byType(SingleChildScrollView), findsWidgets);
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(FadeInImage), findsWidgets);
    });
  });
}*/

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  List<String> newsImagesGallery = [];
  newsImagesGallery.add("https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/WebImages/SwaminarayanJayanti2023_1.jpeg");
  newsImagesGallery.add("https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/WebImages/SwaminarayanJayanti2023_2.jpeg");
  // add news tags list
  List<String> newsTagList = [];
  newsTagList.add('Festivals');
  newsTagList.add('RamNavmi');
  // add news categories list
  List<String> categoriesList = [];
  newsTagList.add('CulturalPrograms');
  newsTagList.add('Sanyukt');

  //create model for latest news
  final latestNewsList = News(
    title: 'Shri Swaminarayan Jayanti Celebrations',
    publishedAt: 'April 1, 2023',
    author: 'BAPS Robbinsville',
    thumbnail: 'https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/webimages/SwaminarayanJayanti2023___12_.jpeg',
    heroImage: 'https://www.baps.org/Data/Sites/1/Media/GalleryImages/26904/webimages/SwaminarayanJayanti2023___12_.jpeg',
    gallery: newsImagesGallery,
    file: '',
    description: 'The auspicious occasions of Shri Swaminarayan Jayanti and Shri Ram Jayanti were celebrated across North America.',
    extraText: '',
    tags: newsTagList,
    categories: categoriesList,
    externalLink: 'https://google.com',
  );

  testWidgets('LatestNews widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.

    await tester.pumpWidget(
        MaterialApp(
            home: Sizer(builder: (context, orientation, deviceType) {
      return LatestNews(
        news: List<News>.generate(1, (index) => latestNewsList),
      );
    })));

    // Check if the widget is displayed correctly
    expect(find.text('Shri Swaminarayan Jayanti Celebrations'), findsOneWidget);
    expect(find.text('View more'), findsOneWidget);
    expect(find.byType(FancyShimmerCachedImage), findsNWidgets(1));

    final customText = find.byType(CustomText);
    expect(customText, findsOneWidget);

    final listView = find.byType(ListView);
    expect(listView, findsOneWidget);

    final listViewWidget = tester.widget<ListView>(listView);
    expect(listViewWidget.physics, isA<BouncingScrollPhysics>());

    await tester.tap(find.text('View more'));

  });
}
