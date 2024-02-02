import 'dart:async';

import 'package:akdmvisitorsapp/router_page/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  setUp(
    () {
      GetIt.instance;
    },
  );
  //enable the AppRouting
  testWidgets('testing route lists', (WidgetTester tester) async {
    final router = AppRouter();
    // passes if routes are available
    expect(router.routes.isNotEmpty, true);
  });
  testWidgets('Get It register or not', (WidgetTester tester) async {
    final getIt = GetIt.instance;
    expect(getIt.isRegistered<AppRouter>(instance: AppRouter().routes), false);
  });

/*  testWidgets('testing route lists', (WidgetTester tester) async {
    var approuter = AppRouter();
    // passes if routes are available
    expect(getIt.get<AppRouter>(), approuter);
  });*/

  //enable the Internet Connectivity plugin

  testWidgets('internet connectivity', (WidgetTester tester) async {
    StreamSubscription? connectivitySubscription;
    final connectivity = Connectivity();
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet) {
        expect("connected", true);
      } else {
        expect("disconnected", false);
      }
    });
  });
  //Get it with Approuter Injection

  testWidgets('internet connectivity', (WidgetTester tester) async {
    final getIt = GetIt.instance;
    expect(getIt.isRegistered<AppRouter>(instance: AppRouter().routes), false);
  });
}
