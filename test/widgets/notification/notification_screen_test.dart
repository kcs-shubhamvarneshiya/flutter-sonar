import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/custome_page.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_filter_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_service.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_state.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/MapMarkerProvider.dart';
import 'package:akdmvisitorsapp/presentaion/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MockNotificationService extends Mock implements NotificationService {
  @override
  Future<List<NotificationLog>> getFcmNotificationList() async {
    List<NotificationLog> notificationList=[];
    var dir = Directory.current.path;
    var currentPath = File('$dir/test/json/notification_log_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final List<dynamic> jsonList = jsonMap['NotificationLog'];
    var mList =jsonList.map((jsonItem) => NotificationLog.fromJson(jsonItem)).toList();
    notificationList.addAll(mList);
    return Future(() => notificationList);
  }
}

class MockSharedPreferences extends Mock implements SharedPreferences {
  @override
  Future<bool> setStringList(String key, List<String> value) {
    return Future.value(true);
  }
}

//class MockNotificationBloc extends MockBloc<NotificationEvent, NotificationState> implements NotificationBloc {}

final getIt = GetIt.instance;

Future<void> setupGetIt(MockNotificationService mockNotificationService, MockSharedPreferences mockSharedPreferences) async {
  getIt.registerSingleton<NotificationService>(mockNotificationService);
  getIt.registerSingleton<SharedPreferences>(mockSharedPreferences);
}

class MockNotificationBloc extends Mock implements NotificationBloc {}
class MockMapMarkerProvider extends Mock implements MapMarkerProvider {}
class MockAttractionFilterBloc extends Mock implements AttractionFilterBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockNotificationService = MockNotificationService();
  final mockSharedPreferences = MockSharedPreferences();
  setupGetIt(mockNotificationService, mockSharedPreferences);

  //late MockNotificationBloc notificationBloc;
  late NotificationBloc notificationBloc;
  late AttractionFilterBloc attractionFilterBloc;
  late NotificationState notificationState;

  setUp(() {
    //notificationBloc = MockNotificationBloc();

    notificationBloc = NotificationBloc();
    attractionFilterBloc=MockAttractionFilterBloc();

    notificationState = const NotificationState(
      notificationList: [],
      isLongPress: false,
      isFiltering: false,
    );
    notificationBloc.add(const NotificationEvent.loadNotificationEvent(false));
  });


  group('Notification screen widget', () {

    Widget notificationWidget() {
        return MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider<AttractionFilterBloc>(
                  create: (context) => attractionFilterBloc,
                ),
                BlocProvider<NotificationBloc>(
                  create: (context) => notificationBloc),
              ],
              child: MultiProvider(
                providers: [
                  //ChangeNotifierProvider<MapMarkerProvider>(create: (_) => mockMapMarkerProvider),
                  ChangeNotifierProvider(create: (_) => MapMarkerProvider()),
                ],
                child: Sizer(
                builder: (context, orientation, deviceType) {
                  return const NotificationScreen();
                }
                ),
              ),
            ),
          ),
        );
    }

    testWidgets('Notification widget', (WidgetTester tester) async {

      await tester.pumpWidget(notificationWidget());

      await tester.pump();

      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(NotificationScreen), findsOneWidget);

      expect(find.byType(SizedBox), findsNWidgets(11));

      expect(find.byType(Scaffold), findsNWidgets(2));

      expect(find.byType(Column), findsNWidgets(2));

      expect(find.byType(VerticalSpace), findsNWidgets(4));

      expect(find.byType(Expanded), findsOneWidget);

      expect(find.byType(SingleChildScrollView),  findsNWidgets(2));

      expect(find.byType(Row), findsNWidgets(2));

      expect(find.byType(BlocBuilder<NotificationBloc, NotificationState>), findsNWidgets(2));

      expect(find.byType(CustomText), findsNWidgets(2));

      expect(find.byType(Padding), findsNWidgets(7));

      expect(find.byType(CustomPage),findsOneWidget);

      expect(find.byType(ListView), findsOneWidget);

      // Dismiss a notification by swiping it away
      await tester.drag(find.byType(Dismissible), const Offset(500.0, 0.0));

      await tester.pumpAndSettle();

      //Verify that the confirmation dialog appears after dismissing a notification
      expect(find.text('Are you sure you want to delete this notification?'), findsOneWidget);

      // Tap on 'Yes' in the confirmation dialog
      await tester.tap(find.text('Yes'));

      await tester.pumpAndSettle();

    });
  });
}

