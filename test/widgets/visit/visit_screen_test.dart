import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_appbar.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_service.dart';
import 'package:akdmvisitorsapp/presentaion/home/visit_plan_list.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/MapMarkerProvider.dart';
import 'package:akdmvisitorsapp/presentaion/visit/accommodations.dart';
import 'package:akdmvisitorsapp/presentaion/visit/attraction_screen.dart';
import 'package:akdmvisitorsapp/presentaion/visit/book_tour.dart';
import 'package:akdmvisitorsapp/presentaion/visit/get_akshardham.dart';
import 'package:akdmvisitorsapp/presentaion/visit/guidlines.dart';
import 'package:akdmvisitorsapp/presentaion/visit/request_group_tour.dart';
import 'package:akdmvisitorsapp/presentaion/visit/visit_screen.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MockVisitService extends Mock implements VisitService{
  @override
  Future<List<Attraction>> getAttractionList() async {
    List<Attraction> attractionList = [];
    var dir = Directory.current.path;
    var currentPath = File('$dir/test/json/attractions_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final List<dynamic> jsonList = jsonMap['attractions'];
    var mList = jsonList.map((jsonItem) => Attraction.fromJson(jsonItem)).toList();
    attractionList.addAll(mList);
    return Future(() => attractionList);
  }

  @override
  Future<List<Attraction>> getFilterAttractionList() async {
    List<Attraction> attractionList = [];
    var dir = Directory.current.path;
    var currentPath = File('$dir/test/json/attractions_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final List<dynamic> jsonList = jsonMap['attractions'];
    var mAttractionList = jsonList.map((jsonItem) => Attraction.fromJson(jsonItem)).toList();

    mAttractionList.removeWhere((element) => element.displayOrder?.visitPlanner == null);
    mAttractionList.sort((a,b){
      var aEL = a.displayOrder?.visitPlanner;
      var bEL = b.displayOrder?.visitPlanner;
      return (aEL ?? 0).compareTo((bEL ?? 0));
    });
    attractionList.addAll(mAttractionList);
    return Future(() => attractionList);
  }
}

class MockSharedPreferences extends Mock implements SharedPreferences {
  // Arrange: Set up the mock behavior for SharedPreferences.
  @override
  List<String>? getStringList(String key) {
    if (key == "keyAttractionListForPlanPref") {
      var dir = Directory.current.path;
      var fileContents = File('$dir/test/json/attractions_test.json').readAsStringSync();
      var jsonData = json.decode(fileContents);
      var jsonList = jsonData['attractions'];
      if (jsonList is List<dynamic>) {
        var stringList = jsonList.map((item) => json.encode(item)).toList();
        return stringList;
      }
    }
  }
}

class MockAppJsonRepository extends Mock implements AppJsonRepository{
  @override
  Future<AppJsonModel> loadJsonAssetData() async {
    var dir = Directory.current.path;
    var currentPath = File('$dir/test/json/read_all_app_file_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final jsonModel = AppJsonModel.fromJson(jsonMap);

    jsonModel.attractions?.removeWhere((element) => element.displayOrder?.visitPlanner == null);
    jsonModel.attractions?.sort((a,b){
      var aEL = a.displayOrder?.visitPlanner;
      var bEL = b.displayOrder?.visitPlanner;
      return (aEL ?? 0).compareTo((bEL ?? 0));
    });

    return jsonModel;
  }
}

GetIt getIt = GetIt.instance;

Future<void> setupGetIt(MockVisitService mockVisitService,MockSharedPreferences mockSharedPreferences, MockAppJsonRepository appJsonRepository) async {
  getIt.registerSingleton<VisitService>(mockVisitService);
  getIt.registerSingleton<SharedPreferences>(mockSharedPreferences);
  getIt.registerSingleton<VisitBloc>(VisitBloc(appJsonRepository));
  getIt.registerSingleton<AppJsonBloc>(AppJsonBloc(appJsonRepository));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late VisitBloc visitBloc;
  late AppJsonBloc appJsonBloc;

  final appJsonRepository = MockAppJsonRepository();
  final mockVisitService = MockVisitService();
  final mockSharedPreferences = MockSharedPreferences();
  setupGetIt(mockVisitService,mockSharedPreferences,appJsonRepository);

  setUp((){
    visitBloc = VisitBloc(appJsonRepository);
    appJsonBloc = AppJsonBloc(appJsonRepository);
    appJsonBloc.add(const LoadAppJsonEvent());
    visitBloc.add(const VisitEvent.loadVisitActivityEvent());
  });

  Widget visitScreenWidget() {
    return MaterialApp(
      home: Scaffold(
        body: MultiProvider(
        providers: [
            ChangeNotifierProvider(create: (_) => MapMarkerProvider()),
        ],
        child:MultiBlocProvider(
          providers: [
            BlocProvider<VisitBloc>(
                create: (context) => visitBloc
            ),
            BlocProvider<AppJsonBloc>(
                create: (context) => appJsonBloc
            ),
          ],
          child:Sizer(
              builder: (context, orientation, deviceType) {
                return  VisitScreen(scrollIndexValue: true);
              }
          ),
        ),
      ),
    ),
    );
  }

  testWidgets('VisitScreen displays widgets and scrolls to a particular index', (WidgetTester tester) async {
    // Build the VisitScreen widget
    await tester.pumpWidget(visitScreenWidget());

    await tester.pump();

    expect(find.byType(VisitScreen), findsOneWidget);

    // Expect the presence of certain widgets before data loaded
    expect(find.byType(CustomAppBar), findsOneWidget);

    expect(find.byType(Center), findsOneWidget);
    // Simulate the loaded state by triggering a state change

    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(PlanMyVisitList), findsOneWidget);

    expect(find.byType(AttractionsScreen), findsOneWidget);

    expect(find.byType(GuidLinesScreen), findsOneWidget);

    expect(find.byType(BookTour), findsOneWidget);

    expect(find.byType(RequestGroupTour), findsOneWidget);

    expect(find.byType(GetAkshardham), findsOneWidget);

    expect(find.byType(Accommodation), findsOneWidget);
    // Wait for any animations to complete
    await tester.pumpAndSettle();
    //Replace the index (5 in this case) with the index you expect to scroll to and Verify that it scrolls to the desired index.
    expect(find.byKey(const ValueKey(5)), findsOneWidget);
  });
}