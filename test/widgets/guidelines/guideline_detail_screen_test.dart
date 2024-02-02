import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/custome_page.dart';
import 'package:akdmvisitorsapp/common_widgets/fancyShimmerCachedImage.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/guideline/guideline_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/guideline/guideline_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/guideline/guideline_state.dart';
import 'package:akdmvisitorsapp/presentaion/guidelines/guideline_detail_screen.dart';
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
  late GuidelineBloc guideLineBloc;

  final appJsonRepository = MockAppJsonRepository();

  setupGetIt(appJsonRepository);

  setUp((){
    guideLineBloc = GuidelineBloc();
    appJsonBloc = AppJsonBloc(appJsonRepository);
    appJsonBloc.add(const LoadAppJsonEvent());
    guideLineBloc.add(const GuidelineTapEvent(0));
  });

  Widget guidelineScreenWidget() {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
            providers: [
              BlocProvider<AppJsonBloc>(
                  create: (context) => appJsonBloc
              ),
              BlocProvider<GuidelineBloc>(
                  create: (context) => guideLineBloc
              ),
            ],
            child:Sizer(
                builder: (context, orientation, deviceType) {
                  return  const GuidLinesDetailScreen();
                }
            ),
          ),
        ),
    );
  }

  testWidgets('GuidLinesDetailScreen Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(guidelineScreenWidget());

    await tester.pump();

    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(GuidLinesDetailScreen), findsOneWidget);

    expect(find.byType(Scaffold), findsNWidgets(2));

    expect(find.byType(SingleChildScrollView), findsOneWidget);

    expect(find.text(guidelines), findsOneWidget);

    expect(find.byType(Center), findsOneWidget);

    expect(find.byType(SizedBox), findsOneWidget);

    expect(find.text("During your visit, we kindly ask you be respectful of fellow visitors and the campus. See our full list of visitor guidelines to learn more."), findsOneWidget);

    expect(find.byType(BlocBuilder<GuidelineBloc, GuidelineState>), findsNWidgets(2));

    expect(find.byType(Column), findsOneWidget);

    expect(find.byType(VerticalSpace), findsNWidgets(2));

    expect(find.byType(Padding), findsNWidgets(11));

    expect(find.byType(ChoiceChip), findsOneWidget);

    expect(find.byType(SizedBox), findsOneWidget);

    expect(find.byType(FancyShimmerCachedImage), findsOneWidget);

    expect(find.byType(ListView), findsOneWidget);

    expect(find.byType(CustomPage), findsOneWidget);

  });

}