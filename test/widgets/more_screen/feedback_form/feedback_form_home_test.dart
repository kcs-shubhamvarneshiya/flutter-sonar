import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/common_widgets/custom_text.dart';
import 'package:akdmvisitorsapp/common_widgets/custome_page.dart';
import 'package:akdmvisitorsapp/common_widgets/widgets.dart';
import 'package:akdmvisitorsapp/model/app_json/app_json.dart';
import 'package:akdmvisitorsapp/model/feedback/submit_feedback.dart';
import 'package:akdmvisitorsapp/model/feedback/submited_response_model.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_state.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/submit_feedback/submit_feedback_state.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_checkbox.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_dropdown.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_form_home.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_multiselect_dropdown.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_radio_btn.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/feedback_text_field.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:akdmvisitorsapp/repository/feedback_repo.dart';
import 'package:akdmvisitorsapp/repository/feedback_repo_impl.dart';
import 'package:akdmvisitorsapp/service/connection_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:async/src/result/result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MockSubmitFeedbackModelDataSource extends Mock implements SubmitFeedbackModelDataSource{}

class MockSubmitFeedbackModelImpl extends Mock implements SubmitFeedbackModelImpl {
  static const feedbackRecord = 'Your feedback record submitted';
  @override
  Future<Result<FeedBackResponseModel>> submitFeedbackData(
      SharedPreferences sp,
      List<Record> records,
      FeedbackRepo feedbackRepo) async {
    final appJsonFeedbackModel = FeedBackResponseModel(createFeedbackRecord: feedbackRecord);
    return Result.value(appJsonFeedbackModel);
  }
}

class MockFeedbackRepo extends Mock implements FeedbackRepo {}

class MockConnectionStatus extends Mock implements IConnectionStatus{
  bool _connected = false;

  @override
  bool get connect => _connected;

  @override
  void setStatus(bool connection) {
    _connected = connection;
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

GetIt getIt = GetIt.instance;

Future<void> setupGetIt(MockAppJsonRepository appJsonRepository, MockSharedPreferences mockSharedPreferences, MockConnectionStatus mockConnectionStatus, MockSubmitFeedbackModelImpl mockFeedbackModelImpl, MockFeedbackRepo mockFeedbackRepo) async {
  getIt.registerSingleton<IConnectionStatus>(mockConnectionStatus);
  getIt.registerSingleton<SubmitFeedbackBloc>(SubmitFeedbackBloc(mockFeedbackModelImpl,mockFeedbackRepo,mockSharedPreferences));
  getIt.registerSingleton<AppJsonBloc>(AppJsonBloc(appJsonRepository));
  getIt.registerSingleton<SharedPreferences>(mockSharedPreferences);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SubmitFeedbackBloc submitFeedbackBloc;
  late AppJsonBloc appJsonBloc;
  final mockFeedbackModelImpl = MockSubmitFeedbackModelImpl();
  final mockFeedbackRepo = MockFeedbackRepo();
  final mockConnectionStatus = MockConnectionStatus();

  List<Record> record=[];
  final appJsonRepository = MockAppJsonRepository();
  final mockSharedPreferences = MockSharedPreferences();
  setupGetIt(appJsonRepository,mockSharedPreferences,mockConnectionStatus,mockFeedbackModelImpl,mockFeedbackRepo);

  setUp((){
    submitFeedbackBloc = SubmitFeedbackBloc(mockFeedbackModelImpl, mockFeedbackRepo, mockSharedPreferences);
    appJsonBloc = AppJsonBloc(appJsonRepository);
    submitFeedbackBloc.add(SubmitFeedbackEvent.loadUserEvent(record));
    appJsonBloc.add(const LoadAppJsonEvent());
    mockConnectionStatus.setStatus(true);
  });

  Widget submitFeedbackScreenWidget(){
    return MaterialApp(
      home: Scaffold(
        body:MultiBlocProvider(
            providers: [
              BlocProvider<SubmitFeedbackBloc>(
                  create: (context) => submitFeedbackBloc
              ),
              BlocProvider<AppJsonBloc>(
                  create: (context) => appJsonBloc
              ),
            ],
            child:Sizer(
                builder: (context, orientation, deviceType) {
                  return  FeedbackFromHome();
                }
            ),
          ),
        ),
    );
  }

  testWidgets('FeedbackFromHome widget test', (WidgetTester tester) async {
    await tester.pumpWidget(submitFeedbackScreenWidget());

    await tester.pump();

    await tester.pumpWidget(FeedbackFromHome());

    //Verify if CircularProgressIndicator is not shown after loading state
    expect(find.byType(CircularProgressIndicator), findsNothing);

    expect(find.byType(CustomText), findsWidgets);

    expect(find.byType(BlocBuilder<SubmitFeedbackBloc, SubmitFeedbackState>), findsOneWidget);

    expect(find.byType(BlocBuilder<AppJsonBloc, AppJsonState>), findsOneWidget);

    //Verify if the form fields are displayed when loaded
    expect(find.byType(TextFormField), findsWidgets);

    expect(find.byType(CustomPage), findsWidgets);

    expect(find.byType(Column), findsWidgets);

    expect(find.byType(Center), findsOneWidget);

    expect(find.byType(VerticalSpace), findsNWidgets(3));

    expect(find.byType(SizedBox), findsNWidgets(7));

    expect(find.byType(SingleChildScrollView), findsWidgets);

    expect(find.byType(ListView), findsWidgets);

    expect(find.byType(FeedbackTextField), findsWidgets);

    expect(find.byType(FeedbackDropdown), findsWidgets);

    expect(find.byType(FeedbackMultiselectDropdown), findsWidgets);

    expect(find.byType(FeedbackRadio), findsWidgets);

    expect(find.byType(FeedbackCheckbox), findsWidgets);

    //Simulate tap on the submit button and verify behavior
    await tester.tap(find.byType(ButtonIcon));

    // Example: Verify if certain widgets are shown or hidden based on different conditions
    // expect(find.byType(YourWidget), findsOneWidget);
    // expect(find.byType(YourWidget), findsNothing);
  });
}