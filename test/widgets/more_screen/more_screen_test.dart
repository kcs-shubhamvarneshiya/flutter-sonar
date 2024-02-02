import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_state.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/MapMarkerProvider.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/more_screen.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

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
class MockSharedPreferences extends Mock implements SharedPreferences {}

GetIt getIt = GetIt.instance;

Future<void> setupGetIt(MockAppJsonRepository appJsonRepository,MockSharedPreferences mockSharedPreferences) async {
  getIt.registerSingleton<AppJsonBloc>(AppJsonBloc(appJsonRepository));
  getIt.registerSingleton<SharedPreferences>(mockSharedPreferences);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppJsonBloc appJsonBloc;

  final appJsonRepository = MockAppJsonRepository();
  final mockSharedPreferences = MockSharedPreferences();
  setupGetIt(appJsonRepository,mockSharedPreferences);

  setUp((){
    appJsonBloc = AppJsonBloc(appJsonRepository);
    appJsonBloc.add(const LoadAppJsonEvent());
  });


  group('More screen List of widgets', () {
    Widget moreScreenWidget() {
      return MaterialApp(
        home: MultiProvider(
          providers: [
          ChangeNotifierProvider(create: (_) => MapMarkerProvider()),
      ],
        child:MultiBlocProvider(
          providers: [
          BlocProvider<AppJsonBloc>(
          create: (context) => appJsonBloc
        ),
      ],
        child:Material(
          child: Sizer(
            builder: (context, orientation, deviceType) {
              return MoreScreen();
            },
          ),
        ),
        ),
        ),
      );
    }

    testWidgets('Test case for More Screen', (WidgetTester tester) async {

      await tester.pumpWidget(moreScreenWidget());

      await tester.pump();

      expect(find.byType(MoreScreen), findsOneWidget);

      expect(find.byType(Scaffold), findsOneWidget);

      expect(find.byType(BlocBuilder<AppJsonBloc, AppJsonState>), findsOneWidget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      expect(find.byType(SingleChildScrollView), findsOneWidget);

      expect(find.byType(Column), findsOneWidget);

      expect(find.byType(Container), findsNWidgets(3));

      expect(find.byType(VerticalSpace), findsNWidgets(6));

      expect(find.byType(HorizontalSpace), findsNWidgets(6));

      expect(find.byType(HorizontalSpace), findsNWidgets(6));

      expect(find.byType(CustomText), findsNWidgets(3));

      expect(find.byType(Row), findsNWidgets(3));

      expect(find.byType(ButtonIcon), findsNWidgets(2));

      expect(find.byType(ListView), findsOneWidget);

      expect(find.byType(FutureBuilder), findsOneWidget);

      expect(find.text('Sample Event Title'), findsOneWidget);

      expect(find.text('Error message'), findsOneWidget);
    });
  });
}

