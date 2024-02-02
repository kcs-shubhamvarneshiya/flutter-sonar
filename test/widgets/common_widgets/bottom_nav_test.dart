import 'package:akdmvisitorsapp/common_widgets/bottom_nav.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/bottombar_bloc/bottombar_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/MapMarkerProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

final getIt = GetIt.instance;

Future<void> setupLocator(MockSharedPreferences mockMockSharedPreferences) async {
  getIt.registerSingleton<SharedPreferences>(mockMockSharedPreferences);
}

class MockSharedPreferences extends Mock implements SharedPreferences{}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final mockMockSharedPreferences = MockSharedPreferences();
  setupLocator(mockMockSharedPreferences);


  testWidgets('HomeBottomNav widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    /*await tester.pumpWidget(
      MaterialApp(
        home: HomeBottomNav(),
      ),
    );*/

    await tester.pumpWidget(
      MaterialApp(
        home:Scaffold(
          body:MultiProvider(
          providers: [
            //Add your providers here
            ChangeNotifierProvider(create: (_) => MapMarkerProvider()),
          ],
          child: Sizer(
            builder: (context, orientation, deviceType) {
              return BlocProvider(
                  create: (context) => BottomBarBloc(),
                  child: HomeBottomNav(),
              );
            },
          ),
        ),
        ),
      ),
    );

    // Verify the initial state of the widget
    expect(find.byType(HomeBottomNav), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(BottomAppBar), findsOneWidget);
    expect(find.byType(IconButton), findsNWidgets(4)); // Assuming you have 4 tabs
    expect(find.byType(InkWell), findsNWidgets(4)); // Assuming you have 4 tabs
    expect(find.byType(CustomText), findsNWidgets(4)); // Assuming you have 4 tabs

    // Assuming that the 'Try Again' button is displayed in the error state
    expect(find.text('Try Again'), findsOneWidget);

    // For simplicity, let's simulate a tap on the first tab
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();


  });
}