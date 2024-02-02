import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/common_widgets/no_attraction.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_change_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/attraction_filter_bloc/attraction_filter_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/explore/map_attraction_screen.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sizer/sizer.dart';

class MockAttraction extends Mock implements Attraction {}

class MockAppJsonRepository extends Mock implements AppJsonRepository {
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

class MockAttractionFilterBloc extends Mock implements AttractionFilterBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AttractionFilterBloc attractionFilterBloc;
  late MockAppJsonRepository mockAppJsonRepository;

  setUp(() {
    mockAppJsonRepository = MockAppJsonRepository();
    attractionFilterBloc = AttractionFilterBloc(mockAppJsonRepository);
    attractionFilterBloc.add(AttractionChangeEvent.tap(false, 0, '',true));
  });

  Widget attractionFilterWidget() {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<AttractionFilterBloc>(
              create: (context) => attractionFilterBloc,
            ),
          ],
          child:Sizer(
                builder: (context, orientation, deviceType) {
                  return  MapAttractionListScreen();
                }
            ),
          ),
      ),
    );
  }


  group('MapAttractionListScreen Widget Test', () {

    testWidgets('Renders MapAttractionListScreen correctly', (WidgetTester tester) async {
      await tester.pumpWidget(attractionFilterWidget());

      expect(find.byType(MapAttractionListScreen), findsOneWidget);

      await tester.pump();

      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(SingleChildScrollView), findsOneWidget);

      final listView = find.byType(ListView);
      expect(listView, findsOneWidget);

      //Check if the ListView has a horizontal scroll physics
      final listViewWidget = tester.widget<ListView>(listView);
      expect(listViewWidget.physics, isA<NeverScrollableScrollPhysics>());

      expect(find.text('Parking A'.toUpperCase()), findsOneWidget);

      expect(find.byType(FancyShimmerCachedImage), findsOneWidget);

      expect(find.byType(ElevatedButton), findsOneWidget);

      expect(find.byType(Expanded), findsOneWidget);

      expect(find.byType(GestureDetector), findsNWidgets(2));

      expect(find.byType(SizedBox), findsNWidgets(9));

      expect(find.byType(CustomText), findsNWidgets(4));

      expect(find.byType(Column), findsNWidgets(3));

    });

  });

  group('MapAttractionListScreen Widget Test with no data', () {

    setUp(() {
      attractionFilterBloc.add(AttractionChangeEvent.tap(false, 0, 'Facilities',true));
    });

    testWidgets('Renders MapAttractionListScreen correctly.', (WidgetTester tester) async {

      await tester.pumpWidget(attractionFilterWidget());

      await tester.pump();

      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(SizedBox), findsOneWidget);

      expect(find.byType(NoAttractionScreen), findsOneWidget);

    });
  });



}