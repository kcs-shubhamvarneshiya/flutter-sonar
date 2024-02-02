import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/swiper_widget.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Swiper widget test case', () {
    Widget swiperWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: SwiperWidget(
                itemLength: 5,
                itemBuilder: (context, index) {
                  return const SizedBox();
                },
                activeColor: ColorPath.primaryColor,
                inActiveColor: ColorPath.secondaryTextColor,
              ),
            );
          },
        ),
      );
    }

    testWidgets('Swiper Test', (WidgetTester tester) async {
      await tester.pumpWidget(swiperWidget());
      expect(find.byType(Swiper), findsWidgets);
      expect(find.byType(Align), findsWidgets);
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Row), findsWidgets);
      expect(find.byType(GestureDetector), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
    });
    testWidgets('Swiper Next Previous Button', (WidgetTester tester) async {
      await tester.pumpWidget(swiperWidget());
      var previousButton = find.byKey(const Key('previous_btn'));
      await tester.tap(previousButton);
      var nextButton = find.byKey(const Key('next_btn'));
      await tester.tap(nextButton);
      await tester.pump();
    });
  });
}
