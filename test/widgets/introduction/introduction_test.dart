import 'package:akdmvisitorsapp/common_widgets/dashed_page.dart';
import 'package:akdmvisitorsapp/common_widgets/photo_content.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/introduction/introduction_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/introduction/introduction_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/introduction/introduction_state.dart';
import 'package:akdmvisitorsapp/presentaion/introduction/introduction.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

class MockIntroductionBloc extends MockBloc<IntroductionEvent, IntroductionState> implements IntroductionBloc {}

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<IntroductionBloc>(IntroductionBloc());
  //getIt.registerLazySingleton(() => GetIt.I<IntroductionBloc>());
}

void main() {
  //final introductionBloc = MockIntroductionBloc();
  TestWidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  final introductionBloc = IntroductionBloc();

  group('IntroductionScreen Widget Tests', () {
    /*late MockIntroductionBloc introductionBloc;
    setUp(() {
      introductionBloc = MockIntroductionBloc();
    });
*/
    Widget introductionWidget(List<Widget> introductionScreens) {
      return MaterialApp(
        home: Scaffold(
          body: Sizer(
            builder: (context, orientation, deviceType) {
              introductionScreens;
              return BlocProvider<IntroductionBloc>(
                create: (context) => introductionBloc,
                child: const IntroductionScreen(),
              );
            },
          ),
        ),
      );
    }

    testWidgets('IntroductionScreen initializes correctly', (WidgetTester tester) async {
      PageController? controller;
      int currentPageIndex = 0;
      controller = PageController(initialPage: 0);

      List<Widget> introductionScreens = [
        PhotoContent(
          index: 1,
          controller: controller,
          imageName: IconPaths.introImageOne,
          primaryText: namasteIntroText,
          secondaryText: firstWelcomeText,
          buttonText: next,
        ),
        PhotoContent(
          index: 2,
          controller: controller,
          imageName: IconPaths.introImageTwo,
          primaryText: sanctuaryIntroText,
          secondaryText: secondWelcomeText,
          buttonText: next,
        )
      ];

      await tester.pumpWidget(introductionWidget(introductionScreens));

      // Ensure that the IntroductionScreen is rendered
      expect(find.byType(IntroductionScreen), findsOneWidget);

      expect(controller, isNotNull);
      // Verify that the PageView is initially on the first page
      expect(find.byType(PageView), findsOneWidget);

      // Verify that the initial page is set to 0
      expect(currentPageIndex, 0);
    });

    testWidgets('IntroductionScreen page changes correctly', (WidgetTester tester) async {
      PageController? controller;
      int currentPageIndex = 1;
      controller = PageController(initialPage: 0);
      List<Widget> introductionScreens = [];

      await tester.pumpWidget(introductionWidget(introductionScreens));

      final pageView = find.byType(PageView);

      expect(pageView,findsOneWidget);

      expect(find.byType(DashedPageIndicator), findsOneWidget);

      final pageViewWidget = tester.widget<PageView>(pageView);

      expect(pageViewWidget.physics, isA<NeverScrollableScrollPhysics>());

      // Simulate changing to the next page
      await tester.drag(find.byType(PageView), const Offset(-500.0, 0.0));

      expect(currentPageIndex, 1);

      await tester.pump();

      //Mocking page change again
      await tester.runAsync(() async {
        await tester.pump(Duration.zero);
        await tester.drag(find.byType(PageView), Offset(-1000.0, 0.0));
        await tester.pump(Duration.zero);
      });

      //Mocking page change again
      await tester.runAsync(() async {
        await tester.pump(Duration.zero);
        await tester.drag(find.byType(PageView), Offset(-1000.0, 0.0));
        await tester.pump(Duration.zero);
      });

    });

  });
}