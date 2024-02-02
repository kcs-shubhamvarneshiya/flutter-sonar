import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_appbar.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/app_json/new_api_json_model.dart';
import 'package:akdmvisitorsapp/presentaion/add_screen/add_screen.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/indoorMap/logic/MapMarkerProvider.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:akdmvisitorsapp/repository/appjson_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:async/src/result/result.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockAppJsonService extends Mock implements AppJsonService {}

class MockAppJsonRepository extends Mock implements AppJsonRepository {
  @override
  Future<AppJsonModel> loadJsonAssetData() async {
    var dir = Directory.current.path;
    var currentPath =
        File('$dir/test/json/read_all_app_file_test.json').readAsStringSync();
    final Map<String, dynamic> jsonMap = json.decode(currentPath);
    final jsonModel = AppJsonModel.fromJson(jsonMap);
    return jsonModel;
  }
}

final getIt = GetIt.instance;

Future<void> setupGetIt(
  MockSharedPreferences mockSharedPreferences,
  MockAppJsonService mockService,
) async {
  getIt.registerSingleton<SharedPreferences>(mockSharedPreferences);
  getIt.registerSingleton<AppJsonService>(mockService);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockSharedPreferences = MockSharedPreferences();
  final mockService = MockAppJsonService();
  setupGetIt(mockSharedPreferences, mockService);

  late MockAppJsonRepository mockTaskRepository;
  late AppJsonBloc appJsonBloc;

  setUp(() {
    mockTaskRepository = MockAppJsonRepository();
    appJsonBloc = AppJsonBloc(mockTaskRepository);
  });

  Widget addItemWidget() {
    return MaterialApp(
      home: Material(
        child: Sizer(builder: (context, orientation, deviceType) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => MapMarkerProvider()),
            ],
            child: Scaffold(
              appBar: CustomAppBar(isNotification: false),
              body: MultiBlocProvider(
                providers: [
                  BlocProvider<AppJsonBloc>(
                    create: (context) => appJsonBloc,
                  ),
                ],
                child: AddScreen(),
              ),
            ),
          );
        }),
      ),
    );
  }

  group('Add Screen widget', () {
    testWidgets('Add item widget', (WidgetTester tester) async {
      await tester.pumpWidget(addItemWidget());

      await tester.pump();

      expect(find.byType(Scaffold), findsNWidgets(2));

      expect(find.byType(Dialog), findsOneWidget);

      expect(find.byType(ListView), findsOneWidget);

      expect(find.byType(Container), findsOneWidget);

      // Tap on the first item in the list
      await tester.tap(find.byType(ListTile).first);

      // Rebuild the widget after the tap
      await tester.pump();

    });

  });
}
