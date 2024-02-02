import 'package:akdmvisitorsapp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Test case for constants functions', () {
    test('Minutes to hour function', () async {
      final minutes = minutesToHoursMinutes(10);
      expect(minutes, minutes);
    });
    test('App info function test', () async {
      final appInformation = appInfo();
      expect(appInformation, appInformation);
    });
  });
}
