import 'package:akdmvisitorsapp/common_widgets/custom_header.dart';
import 'package:akdmvisitorsapp/common_widgets/custome_page.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/login_bloc/login_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/login/login_screen.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MockWebViewPlatform extends Mock implements WebViewPlatform {}

class MockLoginBloc extends Mock implements LoginBloc {}

class MockWebView extends Mock implements WebViewController {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

final getIt = GetIt.instance;

Future<void> setupGetIt(MockSharedPreferences mockSharedPreferences,) async {
  getIt.registerSingleton<SharedPreferences>(mockSharedPreferences);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockLoginBloc mockLoginBloc;
  late MockWebViewPlatform mockWebViewPlatform;
  late MockWebView mockWebView;
  final mockSharedPreferences = MockSharedPreferences();
  setupGetIt(mockSharedPreferences);

  setUp(() {
    mockWebViewPlatform = MockWebViewPlatform();
    mockWebView = MockWebView();
    mockLoginBloc = MockLoginBloc();
  });

  Widget loginScreenWidget() {
    return MaterialApp(
      home: Material(
        child: Sizer(builder: (context, orientation, deviceType) {
          return Scaffold(
              body: MultiBlocProvider(
                providers: [
                  BlocProvider<LoginBloc>(
                    create: (context) => mockLoginBloc,
                  ),
                ],
                child: LoginScreen(),

              ),
          );
        }),
      ),
    );
  }

  testWidgets('LoginScreen Widget Test', (WidgetTester tester) async {

    await tester.pumpWidget(loginScreenWidget());

    expect(find.byType(LoginScreen), findsOneWidget);

    final webViewFinder = find.byType(WebViewWidget);

    expect(webViewFinder, findsOneWidget);

    await tester.pump();

    expect(find.byType(Scaffold), findsOneWidget);

    expect(find.byType(Expanded), findsOneWidget);

    expect(find.byType(Stack), findsOneWidget);

    expect(find.byType(Column), findsOneWidget);

    expect(find.byType(Padding), findsOneWidget);

    expect(find.text('Sign In'), findsOneWidget);

    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    expect(find.byType(CustomPage), findsOneWidget);

    expect(find.byType(CustomHeader), findsOneWidget);

    expect(find.text(signInSSO), findsOneWidget);

  });
}