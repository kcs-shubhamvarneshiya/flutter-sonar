import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/widgets/image_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Test case for Fancy Shimmer Widget', () {
    Widget customPageWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Material(
              child: FancyShimmerCachedImage(
                  imageUrl:'https://media.baps.dev/wp-content/uploads/2021/10/15140152/05-Tapomurti-Nilkanth-Varni-Moods-scaled.jpg'),
            );
          },
        ),
      );
    }

    testWidgets('Fancy Shimmer', (WidgetTester tester) async {
      await tester.pumpWidget(customPageWidget());

      expect(find.byType(CachedNetworkImage), findsWidgets);

      expect(find.byType(ImageShimmerWidget), findsWidgets);

      expect(find.byType(Container), findsWidgets);
    });


    testWidgets('Fancy Shimmer', (WidgetTester tester) async {
      await tester.pumpWidget(
          MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Material(
              child: FancyShimmerCachedImage(
                  imageUrl:'',
                  errorWidget: Image.asset(IconPaths.placeholderImage,fit: BoxFit.cover,)),
            );
          },
        ),
      ));

      expect(find.byType(Container), findsWidgets);

      expect(find.byType(Column), findsWidgets);

      expect(find.byType(Icon), findsWidgets);

      expect(find.byType(CustomText), findsWidgets);

    });

  });







}
