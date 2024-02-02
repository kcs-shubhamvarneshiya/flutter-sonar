import 'package:akdmvisitorsapp/common_widgets/activity_container.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Activity List and Activity Container test case', () {
    Widget activityListWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: ActivityList(
                indexItem: 5,
                itemBuilder: (context, index) => Container(),
              ),
            );
          },
        ),
      );
    }

    testWidgets('Activity List', (WidgetTester tester) async {
      await tester.pumpWidget(activityListWidget());
      expect(find.byType(ListView), findsWidgets);
    });
    //Activity container test case
    Widget activityContainerWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: ActivityContainer(
                title: '',
                onTap: () {},
                time:0,
                imageName: '',
                btnIcon: '',
                btnName: '',
                desc: '',
                isActivityAdded: true,
                  attraction:Attraction()
              ),
            );
          },
        ),
      );
    }


    testWidgets('Activity Container', (WidgetTester tester) async {
      await tester.pumpWidget(activityContainerWidget());
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(ClipRRect), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
      expect(find.byType(Expanded), findsWidgets);
      expect(find.byType(GestureDetector), findsWidgets);
      expect(find.byType(InkWell), findsWidgets);
    });
    testWidgets('Click on desc text', (WidgetTester tester) async {
      await tester.pumpWidget(activityContainerWidget());
      await tester.tap(find.byType(InkWell));
      await tester.pump();
    });
    testWidgets('Click on button', (WidgetTester tester) async {
      await tester.pumpWidget(activityContainerWidget());
      expect(find.byType(Padding), findsWidgets);
     /* await tester.tap(find.byType(ButtonIcon));
      await tester.pump();*/
    });
  });
}
