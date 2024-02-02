import 'package:akdmvisitorsapp/common_widgets/visits_container.dart';
import 'package:akdmvisitorsapp/presentaion/visit/visit_plan.dart';
import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget visitPlanWidget() {
    return MaterialApp(
      home: Scaffold(
        body: Sizer(builder: (context, orientation, deviceType) {
          return const VisitPlan();
        }),
      ),
    );
  }

  testWidgets('VisitPlan displays visit plan details correctly', (WidgetTester tester) async {
    // Build the VisitPlan widget
    await tester.pumpWidget(visitPlanWidget());

    await tester.pump();

    // Expect the presence of certain widgets
    expect(find.text(visitPlan.toUpperCase()), findsOneWidget);

    expect(find.text(visitPlanDesc), findsOneWidget);

    expect(find.text(plan), findsOneWidget);

    expect(find.byType(VisitsContainer), findsOneWidget);

    // Tap the VisitsContainer widget
    await tester.tap(find.byType(VisitsContainer));

    await tester.pump();

    // Verify if the navigation occurs on tap
    expect(find.byType(PlanVisitRoute), findsOneWidget);
  });
}