/*
import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_service.dart';
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

class MockNotificationBloc extends Mock implements NotificationBloc {}

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

class MockSharedPreferences extends Mock implements SharedPreferences {}

final getIt = GetIt.instance;

Future<void> setupGetIt(MockNotificationService mockNotificationService, MockSharedPreferences mockSharedPreferences) async {
  getIt.registerSingleton<NotificationService>(mockNotificationService);
  getIt.registerSingleton<SharedPreferences>(mockSharedPreferences);
}

void main() {
  final mockNotificationService = MockNotificationService();
  final mockSharedPreferences = MockSharedPreferences();
  setupGetIt(mockNotificationService, mockSharedPreferences);

  group('NotificationScreen', () {
    //final mockNotificationBloc = MockNotificationBloc();
    final mockNotificationBloc = NotificationBloc();

    */
/*setUp(() {
      when(mockNotificationBloc.state).thenReturn(NotificationState(
        notificationList: [
          NotificationLog(id: "1", title: 'Notification 1', body: 'Description 1', isRead: false, isSelected: false,),
          NotificationLog(id: "2", title: 'Notification 2', body: 'Description 2', isRead: false, isSelected: false,),
        ],
        isLongPress: false,
        isFiltering: false,
      ));
    });*//*


    testWidgets('renders correctly with data', (WidgetTester tester) async {
      await tester.pumpWidget(
          MaterialApp(home: Scaffold(
        body:BlocProvider.value(
        value: mockNotificationBloc,
        child:MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => MapMarkerProvider()),
          ],
          child: Sizer(
              builder: (context, orientation, deviceType) {
              return const NotificationScreen();
            }
          ),
        ),
        ),),)
      );

      await tester.pump();

      //expect(find.text('Welcome Message from TEMPLE'), findsOneWidget);
      //expect(find.text('Welcome Message from BAPS'), findsOneWidget);

      expect(find.byType(ListView), findsOneWidget);

    });

    testWidgets('taps on notification', (WidgetTester tester) async {
      await tester.pumpWidget(BlocProvider.value(
        value: mockNotificationBloc,
        child: const NotificationScreen(),
      ));

      await tester.tap(find.text('Notification 1'));
      await tester.pump();

      verify(mockNotificationBloc.add(const NotificationEvent.loadNotificationEvent(false))).called(1);
    });
  });
}*/
