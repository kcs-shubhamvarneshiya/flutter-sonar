import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_appbar.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_state.dart';
import 'package:akdmvisitorsapp/presentaion/home/announcement.dart';
import 'package:akdmvisitorsapp/presentaion/home/header_section.dart';
import 'package:akdmvisitorsapp/presentaion/home/home_screen.dart';
import 'package:akdmvisitorsapp/presentaion/home/latest_news.dart';
import 'package:akdmvisitorsapp/presentaion/home/social_media_post.dart';
import 'package:akdmvisitorsapp/presentaion/home/upcoming_events.dart';
import 'package:akdmvisitorsapp/presentaion/home/visit_plan_list.dart';
import 'package:akdmvisitorsapp/presentaion/home/welcome_container.dart';
import 'package:akdmvisitorsapp/presentaion/visit/guidlines.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

class MockAppJsonBloc extends MockBloc<AppJsonEvent, AppJsonState> implements AppJsonBloc {
  MockAppJsonBloc() : super(){
    on<LoadAppJsonEvent>(getUserAssetJsonData);
  }

  @override
  getUserAssetJsonData(LoadAppJsonEvent event, emit) async {
    if(event is LoadAppJsonEvent){
      try {
        var dir = Directory.current.path;
        var currentPath = File('$dir/test/json/read_all_app_file_test.json').readAsStringSync();
        final Map<String, dynamic> jsonMap = json.decode(currentPath);
        final jsonModelData = AppJsonModel.fromJson(jsonMap);
        emit(AppJsonState.loaded(jsonModelData));
      } catch (e) {
        emit(AppJsonState.error(e.toString()));
      }
    }
  }
}

final getIt = GetIt.instance;
// Register the AnnouncementsBloc as a singleton
void setupLocator() {
  getIt.registerLazySingleton(() => GetIt.I<AppJsonBloc>());
  getIt.registerLazySingleton(() => GetIt.I<AppJsonRepository>());
}

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  testWidgets('HomeScreen should render correctly', (WidgetTester tester) async {
    final mockAppJsonBloc = MockAppJsonBloc();

    /*var dir = Directory.current.path;
    var currentPath = File('$dir/test/json/read_all_app_file_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final jsonModelData = AppJsonModel.fromJson(jsonMap);*/

    // Mock the behavior of your Bloc
    //when(mockAppJsonBloc.state).thenReturn(AppJsonState.loaded(jsonModelData));

    await tester.pumpWidget(
      MaterialApp(
          home: Sizer(builder: (context, orientation, deviceType){
        return BlocProvider<AppJsonBloc>(
          create: (context) => AppJsonBloc(getIt()),
          child:BlocBuilder<AppJsonBloc,AppJsonState>(
              bloc: getIt<AppJsonBloc>()..add(const LoadAppJsonEvent()),
              builder: (context, state){
              return HomeScreen();
            }
          ),
        );
      })),
    );

    final customAppBar = find.byType(CustomAppBar);
    final announcementsWidget = find.byType(AnnouncementsWidget);
    final headerSection = find.byType(HeaderSection);
    final welcomeContainer = find.byType(WelcomeContainer);
    final planMyVisitList = find.byType(PlanMyVisitList);
    final guidLinesScreen = find.byType(GuidLinesScreen);
    final upcomingEvents = find.byType(UpcomingEvents);
    final latestNews = find.byType(LatestNews);
    final socialMediaPosts = find.byType(SocialMediaPosts);

    expect(customAppBar, findsOneWidget);
    expect(announcementsWidget, findsOneWidget);
    expect(headerSection, findsOneWidget);
    expect(welcomeContainer, findsOneWidget);
    expect(planMyVisitList, findsOneWidget);
    expect(guidLinesScreen, findsOneWidget);
    expect(upcomingEvents, findsOneWidget);
    expect(latestNews, findsOneWidget);
    expect(socialMediaPosts, findsOneWidget);

  });
}
