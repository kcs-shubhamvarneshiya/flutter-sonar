import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/notification/notification.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_service.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/notification_bloc/notification_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

GetIt sl = GetIt.instance;

Future<void> setupGetIt(MockNotificationService mockNotificationService, MockSharedPreferences mockSharedPreferences) async {
  /*sl.registerLazySingleton<NotificationService>(() => MockNotificationService());
  sl.registerLazySingleton<SharedPreferences>(() => MockSharedPreferences());*/
  sl.registerSingleton<NotificationService>(mockNotificationService);
  sl.registerSingleton<SharedPreferences>(mockSharedPreferences);
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final mockNotificationService = MockNotificationService();
  final mockSharedPreferences = MockSharedPreferences();
  setupGetIt(mockNotificationService,mockSharedPreferences);
  late NotificationBloc notificationBloc;
  //final sharedPreferences = sl<SharedPreferences>();

  final List<NotificationLog> notificationList=[];
  notificationList.add(NotificationLog(id:"1",title:"Welcome Message from TEMPLE",body:"Welcome to mandir area!!.",date:"2023-10-25T22:36:00.733032",type:"FCM",isRead:true,isSelected:false,previewBody:"Jay Swaminarayan Swaminarayan Lord, also known as Bhagwan Swaminarayan.",deepLink:"ATTRACTION:1"));
  notificationList.add(NotificationLog(id:"2",title:"Welcome Message from BAPS",body:"Welcome to akshardham!!.",date:"2023-10-25T22:35:27.165877",type:"FCM",isRead:true,isSelected:false,previewBody:"Jay Swaminarayan Swaminarayan Lord, also known as Bhagwan Swaminarayan.",deepLink:"ATTRACTION:2"));

  group('NotificationBloc', () {
    setUp(() {
      notificationBloc = NotificationBloc();
      //sl.registerSingleton<NotificationService>(mockNotificationService);
      //sl.registerSingleton<SharedPreferences>(mockSharedPreferences);
    });

    blocTest<NotificationBloc, NotificationState>(
      'emits the expected state when NotificationLoadEvent is added',
      build: () => notificationBloc,
      act: (bloc) => bloc.add(const NotificationLoadEvent(false)),
      expect: () => [
         NotificationState(
          notificationList: notificationList.toList(), //Define your expected data
          isLongPress: false,
          isFiltering: true,
        ),
      ],
    );

    test('should set value in preference', () async {
      var dir = Directory.current.path;
      var currentPath = File('$dir/test/json/notification_log_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      final List<dynamic> jsonList = jsonMap['NotificationLog'];
      List<String> stringList = jsonList.map((item) => jsonEncode(item)).toList();
      final result = await mockSharedPreferences.setStringList("notificationList", stringList);
      expect(result, true);
    });

    blocTest<NotificationBloc, NotificationState>(
      'emits the expected state when NotificationRemoveItemEvent is added',
      setUp: () {
      },
      build: ()=> notificationBloc,
      act: (bloc) {
        bloc.add(const NotificationRemoveItemEvent("1"));
      },
      expect: () => [
         NotificationState(
          notificationList: notificationList.toList(), //Define your expected data
          isLongPress: false,
          isFiltering: true,
        ),
      ],
    );
    });


  group('NotificationBloc', () {
    setUp(() {
      notificationBloc = NotificationBloc();
    });

      const indexToSelect = 0; // Replace with the index you want to select

      blocTest<NotificationBloc, NotificationState>(
        'emits the expected state when NotificationSelectedEvent is added',
        setUp: () {
          notificationBloc.emit(NotificationState(notificationList: notificationList, isLongPress: false, isFiltering: false));
        },
        build: () => notificationBloc,
        act: (bloc) => bloc.add(NotificationSelectedEvent(notificationList.toList(),false,indexToSelect)),
        expect: () => [
          NotificationState(notificationList: notificationList..[indexToSelect] = notificationList[indexToSelect].copyWith(isSelected: true),
          isLongPress: false, isFiltering: false,)
        ],
      );


    blocTest<NotificationBloc, NotificationState>(
      'emits the expected state when NotificationSelectedEvent is added',
      setUp: () {
        notificationBloc.emit(NotificationState(notificationList: notificationList, isLongPress: true, isFiltering: false));
      },
      build: () => notificationBloc,
      act: (bloc) => bloc.add(NotificationRemoveSelectedEvent(notificationList.toList())),
      expect: () => [
        const NotificationState(notificationList:[], isLongPress: false, isFiltering: false,)
      ],
    );


  });


}