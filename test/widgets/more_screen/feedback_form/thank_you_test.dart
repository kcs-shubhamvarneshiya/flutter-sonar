import 'dart:io';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_events.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/app_json/app_json_state.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/feedback_form/thank_you_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sizer/sizer.dart';

class MockAppJsonBloc extends MockBloc<AppJsonEvent, AppJsonState> implements AppJsonBloc {}

void main() {
  late MockAppJsonBloc mockWeatherBloc;

  setUp(() {
    mockWeatherBloc = MockAppJsonBloc();
    HttpOverrides.global = null;
  });


  Widget _makeTestWidget() {
    return MaterialApp(
      home: Scaffold(
        body:Sizer(
          builder: (context, orientation, deviceType) {
            return BlocProvider<AppJsonBloc>(
              create: (context) => mockWeatherBloc,
              child: MaterialApp(
                home: ThankYouScreen(),
              ),
            );
          }
    ),),
    );
  }


  /*testWidgets(
    'text field should trigger state to change from empty to loading, This is a successful test',
        (widgetTester) async {
      //arrange
      when(() => mockWeatherBloc.state).thenReturn(WeatherEmpty());

      //act
      await widgetTester.pumpWidget(_makeTestWidget(const WeatherScreen()));
      var textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      await widgetTester.enterText(textField, 'Cairo');
      await widgetTester.pump();
      expect(find.text('Cairo'), findsOneWidget);
    },
  );*/

  testWidgets(
    'should show progress indicator when state is loading, This is a successful test',
        (widgetTester) async {
      //arrange
      when(() => mockWeatherBloc.state).thenReturn(() {
        return const AppJsonState.loading();
      },);
      //act
      await widgetTester.pumpWidget(_makeTestWidget());

      //assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  /*testWidgets(
    'should show widget contain weather data when state is weather loaded, This is a successful test',
        (widgetTester) async {
      //arrange
      when(() => mockWeatherBloc.state)
          .thenReturn(const WeatherLoaded(testWeather));

      //act
      await widgetTester.pumpWidget(_makeTestWidget());
      await widgetTester.pumpAndSettle(const Duration(seconds:1));

      //assert
      expect(find.byKey(const Key('weather_data')), findsOneWidget);
    },
  );*/
}