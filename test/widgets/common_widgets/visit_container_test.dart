import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/visits_container.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  group('Visit Container test case', () {
    Widget visitContainerWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
              body: VisitsContainer(
                title: '',
                onTap: () {},
                description: '',
                imageName: IconPaths.splashImage,
                subText: '',
              ),
            );
          },
        ),
      );
    };

    testWidgets('Visit Container', (WidgetTester tester) async {
      await tester.pumpWidget(visitContainerWidget());
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(SizedBox), findsWidgets);
      expect(find.byType(Row), findsWidgets);
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Expanded), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
      expect(find.byType(GestureDetector), findsWidgets);
    });
  });
}
