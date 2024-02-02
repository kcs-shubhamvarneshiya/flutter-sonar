import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/model/accommodations/accommodations.dart';
import 'package:akdmvisitorsapp/presentaion/visit/accommodations.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sizer/sizer.dart';

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Notification screen widget', () {
    final List<Accommodations> mockAccommodationList = [
      Accommodations(
        id: 40,
        name: "BAPS Swaminarayan Chhatralaya-1",
        location: "Adipur -1",
        price: 400,
        link: "https://www.baps.org/Terms-and-Conditions.aspx",
        thumbnail:"https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/BAPS_Mandir_Chino_Hills.jpg/1280px-BAPS_Mandir_Chino_Hills.jpg",
      ),
    ];

    Widget accommodationWidget(List<Accommodations> mockAccommodationList) {
      return MaterialApp(
        home: Scaffold(
          body: Sizer(builder: (context, orientation, deviceType) {
            return Accommodation(accommodation: mockAccommodationList);
          }),
        ),
      );
    }

    testWidgets('Renders empty container when accommodation', (WidgetTester tester) async {

      await tester.pumpWidget(accommodationWidget(mockAccommodationList));

      await tester.pump();

      expect(find.byType(Accommodation), findsOneWidget);

      expect(find.byType(Column), findsNWidgets(3));

      expect(find.byType(ListView), findsOneWidget);

      expect(find.byType(CustomText), findsWidgets);

      expect(find.byType(SizedBox), findsWidgets);

      expect(find.byType(ClipRRect), findsNWidgets(mockAccommodationList.length));

      expect(find.byType(Container), findsNWidgets(2));

      expect(find.byType(FancyShimmerCachedImage), findsNWidgets(mockAccommodationList.length));

      expect(find.byType(GestureDetector),  findsNWidgets(2));

      expect(find.text('BAPS Swaminarayan Chhatralaya-1'), findsOneWidget);

      expect(find.text(viewMore), findsOneWidget);

    });

    testWidgets('Renders empty container when accommodation empty', (WidgetTester tester) async {

      await tester.pumpWidget(accommodationWidget([]));

      await tester.pump();

      expect(find.byType(Accommodation), findsOneWidget);

      expect(find.byType(Column), findsOneWidget);

      expect(find.byType(Container), findsOneWidget);

      expect(find.byType(ListView), findsNothing);
    });

  });
}
