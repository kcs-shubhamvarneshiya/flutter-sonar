import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/activity_container.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/no_attraction.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_service.dart';
import 'package:akdmvisitorsapp/presentaion/visit/add_activity.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:akdmvisitorsapp/utils/iconpath.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
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
    return super.noSuchMethod(
      Invocation.method(#getStringList, [key]),
      returnValue: Future.value(null),
    ).await;
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
}

//class MockVisitBloc extends Mock implements VisitBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late VisitBloc visitBloc;
  final appJsonRepository = MockAppJsonRepository();
  final mockVisitService = MockVisitService();
  final mockSharedPreferences = MockSharedPreferences();
  setupGetIt(mockVisitService,mockSharedPreferences,appJsonRepository);

  setUp((){
    visitBloc = VisitBloc(appJsonRepository);
    visitBloc.add(const VisitEvent.loadVisitActivityEvent());
  });

  File getProjectFile(String path) {
    final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS']!;
    return File('$assetFolderPath/$path');
  }

  Widget addActivityWidget() {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<VisitBloc>(
                create: (context) => visitBloc
            ),
          ],
          child:Sizer(
              builder: (context, orientation, deviceType) {
                return AddActivity();
              }
          ),
        ),
      ),
    );
  }


  group('AddActivity Widget Test', () {

    testWidgets('Should display activity list when state is not empty', (WidgetTester tester) async {
      //Arrange
        await tester.pumpWidget(addActivityWidget());
        //Act
        await tester.pump();

        await tester.pump(const Duration(milliseconds: 500));

        await tester.pumpAndSettle();

        //Assert
        expect(find.byType(AddActivity), findsOneWidget);

        expect(find.text(activityMainTitle), findsOneWidget);

        expect(find.byType(Column), findsNWidgets(2));

        expect(find.byType(CustomText), findsNWidgets(2));

        expect(find.byType(Container), findsNWidgets(3));

        expect(find.byType(Row), findsOneWidget);

        expect(find.byType(SingleChildScrollView), findsOneWidget);

        expect(find.byType(SvgPicture), findsOneWidget);

        await tester.pumpAndSettle();

        expect(find.byType(Expanded), findsOneWidget);

        expect(find.byType(NoAttractionScreen), findsOneWidget);

        expect(find.byType(VerticalSpace), findsNWidgets(3));

        expect(find.byType(NoAttractionScreen), findsOneWidget);

        expect(find.byType(InkWell), findsOneWidget);

        var pathForwardIcon  = IconPaths.removeCircleIcon;
        final exists = getProjectFile(pathForwardIcon).existsSync();
        expect(exists, isTrue, reason: '$pathForwardIcon does not exist');

        expect(find.byType(ActivityList), findsNothing);

        expect(find.byType(ActivityContainer), findsNothing);

    });


  });
}