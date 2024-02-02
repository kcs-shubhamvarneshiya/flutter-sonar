import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/news_event_common_widget.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/latest_news_item.dart';
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

  Widget latestNewsItemsScreenWidget() {
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
                return LatestNewsItems();
              }
          ),
        ),
      ),
    );
  }

  group('LatestNewsItems Widget Test', () {

    testWidgets('LatestNewsItems Widget Test', (WidgetTester tester) async {

          await tester.pumpWidget(latestNewsItemsScreenWidget());

          await tester.pump();

          expect(find.byType(LatestNewsItems), findsOneWidget);

          expect(find.byType(Scaffold), findsNWidgets(2));

          expect(find.byType(CircularProgressIndicator), findsOneWidget);

          expect(find.byType(Expanded), findsOneWidget);

          final listView = find.byType(ListView);
          expect(listView, findsOneWidget);

          final listViewWidget = tester.widget<ListView>(listView);
          expect(listViewWidget.physics, isA<ClampingScrollPhysics>());

          expect(find.byType(NewsEventCommonWidget), findsOneWidget);


        });

    /*testWidgets('Widget shows error text when error state received', (WidgetTester tester) async {
          final errorMessage = 'Error message';

          when(mockAppJsonBloc.state).thenReturn(AppJsonState.error(errorMessage));

          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<AppJsonBloc>(
                create: (context) => mockAppJsonBloc,
                child: LatestNewsItems(),
              ),
            ),
          );

          expect(find.text(errorMessage), findsOneWidget);
        });*/


  });
}

