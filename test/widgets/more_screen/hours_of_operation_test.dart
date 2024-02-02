import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/hours_operation.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
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

GetIt getIt = GetIt.instance;

Future<void> setupGetIt(MockAppJsonRepository appJsonRepository) async {
  getIt.registerSingleton<AppJsonBloc>(AppJsonBloc(appJsonRepository));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppJsonBloc appJsonBloc;

  final appJsonRepository = MockAppJsonRepository();

  setupGetIt(appJsonRepository);

  setUp((){
    appJsonBloc = AppJsonBloc(appJsonRepository);
    appJsonBloc.add(const LoadAppJsonEvent());
  });

  Widget hoursOperationScreenWidget() {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<AppJsonBloc>(
                create: (context) => appJsonBloc
            ),
          ],
          child:Sizer(
              builder: (context, orientation, deviceType) {
                return HoursOperationScreen();
              }
          ),
        ),
      ),
    );
  }

  group('HoursOperationScreen Widget Test', () {

    testWidgets('Widget shows CircularProgressIndicator when loading', (WidgetTester tester) async {

      await tester.pumpWidget(hoursOperationScreenWidget());

      await tester.pump();

      expect(find.byType(HoursOperationScreen), findsOneWidget);

      expect(find.byType(Scaffold), findsNWidgets(2));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      expect(find.byType(Column), findsOneWidget);

      expect(find.byType(Container), findsOneWidget);

      expect(find.byType(Expanded), findsOneWidget);

      //expect(find.byType(VerticalSpace), findsNWidgets(3));

      final listView = find.byType(ListView);
      expect(listView, findsOneWidget);

      final listViewWidget = tester.widget<ListView>(listView);
      expect(listViewWidget.physics, isA<ClampingScrollPhysics>());

      expect(find.byType(RawScrollbar), findsOneWidget);

      expect(find.byType(HorizontalSpace), findsOneWidget);

      expect(find.byType(CustomText), findsOneWidget);

      expect(find.byType(SizedBox), findsOneWidget);

      expect(find.byType(DayTimeWidget), findsOneWidget);

    });

  });
}