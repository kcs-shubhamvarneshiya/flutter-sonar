import 'package:akdmvisitorsapp/common_widgets/custome_page.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/webView/webPageErrorBloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/webView/webView_event.dart';
import 'package:akdmvisitorsapp/presentaion/more_screen/more_details.dart';
import 'package:akdmvisitorsapp/service/connection_service.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:sizer/sizer.dart';

class MockConnectionStatus extends Mock implements IConnectionStatus {
  bool _connected = false;

  @override
  bool get connect => _connected;

  @override
  void setStatus(bool connection) {
    _connected = connection;
  }
}

class MockWebViewErrorBloc extends Mock implements WebViewErrorBloc {}

class MockInAppWebViewController extends Mock implements InAppWebViewController {}

GetIt getIt = GetIt.instance;

Future<void> setupGetIt(MockConnectionStatus mockConnectionStatus) async {
  getIt.registerSingleton<IConnectionStatus>(mockConnectionStatus);
  getIt.registerSingleton<WebViewErrorBloc>(WebViewErrorBloc());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late WebViewErrorBloc webViewErrorBloc;

  final mockConnectionStatus = MockConnectionStatus();

  setupGetIt(mockConnectionStatus);

  setUp((){
    mockConnectionStatus.setStatus(true);
    webViewErrorBloc = WebViewErrorBloc();
    webViewErrorBloc.add(const WebViewClickEvent(false,""));
  });

  Widget moreDetailsScreenWidget(){
    return MaterialApp(
      home: Material(
        child: Scaffold(
          body: MultiBlocProvider(
            providers: [
              BlocProvider<WebViewErrorBloc>(
                  create: (context) => webViewErrorBloc
              ),
            ],
            child:Sizer(
                builder: (context, orientation, deviceType) {
                  return const MoreDetails(url: 'https://www.baps.org/About-BAPS.aspx', pageName: 'About');
                }
            ),
          ),
        ),
      ),
    );
  }

  group('MoreDetails Widget Test', () {
    /*late MockWebViewErrorBloc mockWebViewErrorBloc;
    setUp(() {
      mockWebViewErrorBloc = MockWebViewErrorBloc();
    });*/

    testWidgets('Widget shows load data', (WidgetTester tester) async {

      await tester.pumpWidget(moreDetailsScreenWidget());

      await tester.pump();

      expect(find.byType(MoreDetails), findsOneWidget);

      expect(find.byType(Column), findsOneWidget);

      expect(find.byType(Expanded), findsOneWidget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      expect(find.byType(Stack), findsNWidgets(2));

      expect(find.byType(Container), findsNWidgets(2));

      expect(find.byType(SizedBox), findsNWidgets(3));

      expect(find.byType(Center), findsOneWidget);

      expect(find.byType(InAppWebView), findsOneWidget);

      expect(find.byType(CustomPage), findsOneWidget);

      expect(find.text(noInternetMessage), findsOneWidget);


    });

    /*testWidgets('Widget displays error message on error state',
            (WidgetTester tester) async {
          const errorMessage = 'Error message';

          when(mockWebViewErrorBloc.iConnectionStatus)
              .thenReturn(WebViewErrorState(connect: true));

          when(mockWebViewErrorBloc.state)
              .thenReturn(WebViewState.webViewClickState(true, "-2"));

          await tester.pumpWidget(
            MaterialApp(
              home: BlocProvider<WebViewErrorBloc>(
                create: (context) => mockWebViewErrorBloc,
                child: MoreDetails(url: 'example.com', pageName: 'Page Name'),
              ),
            ),
          );

          expect(find.text(errorMessage), findsOneWidget);
        });*/

  });
}