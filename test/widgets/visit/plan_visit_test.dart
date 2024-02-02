import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/activity_container.dart';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_service.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/visit_bloc/visit_state.dart';
import 'package:akdmvisitorsapp/presentaion/visit/plan_visit.dart';
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

class MockVisitService extends Mock implements VisitService {
  @override
  Future<List<Attraction>> getAttractionList() async {
    List<Attraction> attractionList = [];
    var dir = Directory.current.path;
    var currentPath =
        File('$dir/test/json/attractions_test.json').readAsStringSync();
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
    var currentPath =
        File('$dir/test/json/attractions_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final List<dynamic> jsonList = jsonMap['attractions'];
    var mAttractionList =
        jsonList.map((jsonItem) => Attraction.fromJson(jsonItem)).toList();

    mAttractionList
        .removeWhere((element) => element.displayOrder?.visitPlanner == null);
    mAttractionList.sort((a, b) {
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
      var fileContents =
          File('$dir/test/json/attractions_test.json').readAsStringSync();
      var jsonData = json.decode(fileContents);
      var jsonList = jsonData['attractions'];
      if (jsonList is List<dynamic>) {
        var stringList = jsonList.map((item) => json.encode(item)).toList();
        return stringList;
      }
    }
  }
}

class MockAppJsonRepository extends Mock implements AppJsonRepository {
  @override
  Future<AppJsonModel> loadJsonAssetData() async {
    var dir = Directory.current.path;
    var currentPath =
        File('$dir/test/json/read_all_app_file_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final jsonModel = AppJsonModel.fromJson(jsonMap);

    jsonModel.attractions
        ?.removeWhere((element) => element.displayOrder?.visitPlanner == null);
    jsonModel.attractions?.sort((a, b) {
      var aEL = a.displayOrder?.visitPlanner;
      var bEL = b.displayOrder?.visitPlanner;
      return (aEL ?? 0).compareTo((bEL ?? 0));
    });

    return jsonModel;
  }
}

GetIt getIt = GetIt.instance;

Future<void> setupGetIt(
    MockVisitService mockVisitService,
    MockSharedPreferences mockSharedPreferences,
    MockAppJsonRepository appJsonRepository) async {
  getIt.registerSingleton<VisitService>(mockVisitService);
  getIt.registerSingleton<SharedPreferences>(mockSharedPreferences);
  getIt.registerSingleton<VisitBloc>(VisitBloc(appJsonRepository));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late VisitBloc visitBloc;
  final appJsonRepository = MockAppJsonRepository();
  final mockVisitService = MockVisitService();
  final mockSharedPreferences = MockSharedPreferences();
  setupGetIt(mockVisitService, mockSharedPreferences, appJsonRepository);

  File getProjectFile(String path) {
    final String assetFolderPath = Platform.environment['UNIT_TEST_ASSETS']!;
    return File('$assetFolderPath/$path');
  }

  setUp(() {
    visitBloc = VisitBloc(appJsonRepository);
    visitBloc.add(const VisitEvent.loadVisitActivityEvent());
  });

  // PlanVisit Widget Test
  Widget planVisitWidget() {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<VisitBloc>(create: (context) => visitBloc),
          ],
          child: Sizer(
            builder: (BuildContext context, Orientation orientation,
                DeviceType deviceType) {
              return PlanVisit();
            },
          ),
        ),
      ),
    );
  }

  testWidgets('PlanVisit Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(planVisitWidget());

    await tester.pump();

    expect(find.byType(PlanVisit), findsOneWidget);

    // Verifying the existence of specific widgets using finder methods like find.byType and find.byKey
    expect(find.byType(WillPopScope), findsOneWidget);

    expect(find.byType(Scaffold), findsNWidgets(2));

    expect(find.byType(AppBar), findsOneWidget);

    expect(find.byType(BlocBuilder<VisitBloc, VisitState>), findsOneWidget);

    expect(find.byType(Column), findsWidgets);


    expect(find.byType(ButtonIcon), findsWidgets);

    expect(find.byType(SvgPicture), findsWidgets);

    expect(find.byType(SingleChildScrollView), findsOneWidget);

    expect(find.byType(SizedBox), findsWidgets);

    expect(find.byType(CustomText), findsNWidgets(3));

    expect(find.byType(Row), findsNWidgets(2));

    expect(find.byType(VerticalSpace), findsOneWidget);

    expect(find.byType(Padding), findsNWidgets(8));

    expect(find.byType(Expanded), findsWidgets);

    expect(find.text(planWizard), findsNothing);

    expect(find.text('No activities added'), findsNothing);

    expect(find.byType(GestureDetector), findsNWidgets(2));

    expect(find.byType(Container), findsNWidgets(2));


    var path  = IconPaths.addIconButton;
    final exists = getProjectFile(path).existsSync();
    expect(exists, isTrue, reason: '$path does not exist');

    var deleteIocnPath  = IconPaths.deleteCircleIcon;
    final existsIcon = getProjectFile(deleteIocnPath).existsSync();
    expect(existsIcon, isTrue, reason: '$deleteIocnPath does not exist');

    expect(find.byType(ActivityList), findsOneWidget);

  });
}
