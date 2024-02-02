import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/dependencies.dart';
import 'package:akdmvisitorsapp/presentaion/visit/visit_plan.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/utils/colors.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  File getProjectFile(String path) {
    final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS']!;
    return File('$assetFolderPath/$path');
  }

  group('Customize visit plan', () {
    // network image widget
    Widget customizeVisitPlanWidget() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return const VisitPlan();
          },
        ),
      );
    }


    testWidgets('Find text on visit plan container',
        (WidgetTester tester) async {
      await tester.pumpWidget(customizeVisitPlanWidget());
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(VerticalSpace), findsWidgets);
      expect(find.byType(CustomText), findsWidgets);
      expect(find.byType(Align), findsWidgets);
      expect(find.byType(IconContainer), findsWidgets);
    });

    test('to render specific image in intro ', () {
      var path = IconPaths.placeholderImage;
      final exists = getProjectFile(path).existsSync();
      expect(exists, isTrue, reason: '$path does not exist');
    });

    Widget pushAddActivityScreen() {
      return MaterialApp(
        home: Sizer(
          builder: (context, orientation, deviceType) {
            return GestureDetector(
              onTap: () {
                getIt<AppRouter>().push(PlanVisitRoute());
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

    testWidgets('open add activity screen', (tester) async {
      await tester.pumpWidget(pushAddActivityScreen());
      expect(find.byType(GestureDetector), findsOneWidget);
    });
    testWidgets('plan visit button', (widgetTester) async {
      await widgetTester.pumpWidget(customizeVisitPlanWidget());
      final Finder buttonToTap = find.byKey(const Key('plan_btn'));
      await widgetTester.dragUntilVisible(
        buttonToTap,
        find.byType(IconContainer),
        const Offset(0, 50),
      );
      await widgetTester.tap(buttonToTap);
      await widgetTester.pump();
    });
  });
}
