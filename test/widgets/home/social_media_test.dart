import 'package:akdmvisitorsapp/common_widgets/custom_section_title.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/model/social_media/social_media.dart';
import 'package:akdmvisitorsapp/presentaion/home/social_media_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Create a list of SocialMedia with test data.
  final List<SocialMedia> socialMediaList = [
    SocialMedia(
        type: "FACEBOOK",
        link: "https://caiosdf.com",
        handle: "facebook.com",
        date: "2023-11-07T18:30:00.000Z",
        description: "facebook is famous app.",
        thumbnail: "https://baps-visitor-app.s3.amazonaws.com/socialMedia/1686127091054_images.jpg",
        profileImage: "https://baps-visitor-app.s3.amazonaws.com/socialMedia/1686127092396_insta.jpg")
    // Add more test data items as needed.
  ];

  Widget socialMediaWidget(List<SocialMedia> socialMediaList) {
    return MaterialApp(
      home: Scaffold(
        body: Sizer(builder: (context, orientation, deviceType) {
          return SocialMediaPosts(socialMedia: socialMediaList);
        }),
      ),
    );
  }

  testWidgets('SocialMediaPosts displays title and social media posts',
      (WidgetTester tester) async {
    // Build the SocialMediaPosts widget with the test data.
    await tester.pumpWidget(socialMediaWidget(socialMediaList));

    // Verify that the title 'Connect With Us' is present in the widget tree.
    expect(find.text("facebook is famous app."), findsOneWidget);

    // Verify that each social media post is displayed.
    for (final socialMedia in socialMediaList) {
      expect(find.text(socialMedia.handle!), findsOneWidget);
      expect(find.text(socialMedia.description!), findsOneWidget);
    }

    expect(find.byType(FancyShimmerCachedImage), findsNWidgets(2));
    expect(find.byType(CustomSectionTitle), findsNWidgets(1));

    final listView = find.byType(ListView);
    expect(listView, findsOneWidget);

    final listViewWidget = tester.widget<ListView>(listView);
    expect(listViewWidget.physics, isA<BouncingScrollPhysics>());
  });

  testWidgets('SocialMediaPosts displays correct number of posts',
      (WidgetTester tester) async {
    // Create a list of SocialMedia with test data (with 3 items).
    final List<SocialMedia> socialMediaList = [
      SocialMedia(
        handle: 'SocialMediaHandle1',
        date: '2023-10-30T14:30:00Z',
        type: 'Facebook',
        link: 'https://facebook.com',
        profileImage: 'profile_image_url',
        thumbnail: 'thumbnail_url',
        description: 'SocialMediaDescription1',
      ),
      SocialMedia(
        handle: 'SocialMediaHandle2',
        date: '2023-10-30T15:30:00Z',
        type: 'Twitter',
        link: 'https://twitter.com',
        profileImage: 'profile_image_url',
        description: 'SocialMediaDescription2',
      ),
      SocialMedia(
        handle: 'SocialMediaHandle3',
        date: '2023-10-30T16:30:00Z',
        type: 'Instagram',
        link: 'https://instagram.com',
        profileImage: 'profile_image_url',
        description: 'SocialMediaDescription3',
      ),
    ];

    // Build the SocialMediaPosts widget with the test data.
    await tester.pumpWidget(socialMediaWidget(socialMediaList));

    //Verify that there are three social media posts in the widget tree.
    expect(find.byType(ListTile), findsNWidgets(3));
  });

  testWidgets('SocialMediaPosts displays no posts when empty list',
      (WidgetTester tester) async {
    // Create an empty list of SocialMedia.
    final List<SocialMedia> emptySocialMediaList = [];

    // Build the SocialMediaPosts widget with the empty list.
    await tester.pumpWidget(socialMediaWidget(emptySocialMediaList));

    // Verify that there is no social media post in the widget tree.
    expect(find.byType(ListTile), findsNothing);
  });
}
