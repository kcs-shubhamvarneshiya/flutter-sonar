import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/campus/campus.dart';
import 'package:akdmvisitorsapp/model/lookups/lookups.dart';
import 'package:akdmvisitorsapp/presentaion/visit/get_akshardham.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget getAkshardhamWidget() {
    return MaterialApp(
      home: Scaffold(
        body: Sizer(builder: (context, orientation, deviceType) {
          return GetAkshardham(
            campus: Campus(latitude: "40.2537234", longitude: "74.5797675"), // Replace with appropriate data
            lookups: Lookups(
              uberDeeplink: 'https://m.uber.com/ul/?',
              lyftDeeplink: 'https://www.lyft.com/signup/SDKSIGNUP?clientId=vtsay9k4lIt6',
            ),
          );
        }),
      ),
    );
  }

  testWidgets('GetAkshardham widget displays map and buttons', (WidgetTester tester) async {
    //Build the GetAkshardham widget

    await tester.pumpWidget(getAkshardhamWidget());

    await tester.pump();

    expect(find.byType(GetAkshardham), findsWidgets);

    // Find widgets by type
    expect(find.byType(DecoratedBox), findsNWidgets(6));

    expect(find.byType(Container), findsWidgets);

    expect(find.byType(CustomText), findsWidgets);

    expect(find.byType(Stack), findsNWidgets(7));

    expect(find.byType(FlutterMap), findsOneWidget);

    expect(find.byType(GestureDetector), findsNWidgets(3));

    expect(find.byType(WidgetContainer), findsNWidgets(3));

    expect(find.byType(SvgPicture), findsNWidgets(3));

    expect(find.byType(Column), findsNWidgets(2));

    expect(find.byType(VerticalSpace), findsNWidgets(6));

    expect(find.byType(Padding), findsNWidgets(4));

    // Wait for animations to complete
    await tester.pumpAndSettle();

  });
}