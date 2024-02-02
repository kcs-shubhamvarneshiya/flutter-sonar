import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_state.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/thank_you_page.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
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
    //appJsonBloc.add(const LoadAppJsonEvent());
    appJsonBloc.add(const AppJsonEvent.loadUserEvent());
  });

  Widget thankYouScreenWidget() {
    return MaterialApp(
      home: Scaffold(
        body:Sizer(
            builder: (context, orientation, deviceType) {
              return BlocProvider<AppJsonBloc>(
                create: (context) => appJsonBloc,
                child: ThankYouScreen(),
              );
            }
        ),
      ),
    );
  }

  group("AppJsonBloc", () {

    testWidgets('ThankYouScreen widget test', (WidgetTester tester) async {
      await tester.pumpWidget(thankYouScreenWidget());

      await tester.pump();

      await tester.pump(Duration.zero);

      print("Initial state: ${appJsonBloc.state}");

      expect(find.byType(ThankYouScreen), findsOneWidget);

      expect(find.byType(Container),  findsNWidgets(2));

      expect(find.byType(BlocBuilder<AppJsonBloc, AppJsonState>), findsOneWidget);

      await tester.pumpWidget(thankYouScreenWidget());

      //await tester.pump(const Duration(milliseconds: 500));

      print("Current state: ${appJsonBloc.state}");

      expect(find.byType(Center), findsOneWidget);

      expect(find.byType(Padding), findsOneWidget);

      expect(find.byType(Column), findsOneWidget);

      expect(find.byType(Expanded), findsOneWidget);

      expect(find.byType(CustomText), findsOneWidget);

      expect(find.byType(VerticalSpace), findsOneWidget);

      expect(find.byType(ListView), findsOneWidget);

      expect(find.byType(ButtonIcon), findsOneWidget);

      expect(find.text(thanksFeedback), findsOneWidget);

      // Trigger tap on a button
      await tester.tap(find.byKey(const Key('your_button_key')));

      //verify(appJsonBloc.add(const LoadAppJsonEvent())).called(1);
    });

  });
}