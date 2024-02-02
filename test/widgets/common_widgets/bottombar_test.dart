import 'package:akdmvisitorsapp/common_widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('custom bottm bar', () {

    Widget bottomBar() {
      return   MaterialApp(home: HomeBottomNav ());
    }
  testWidgets('Custom Bottom Navigation Bar call back test', (
      WidgetTester tester) async {
    late int mutatedIndex =0 ;
    await tester.pumpWidget(bottomBar());
    expect(find.byType(AppBar), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Padding), findsWidgets);

  });

});
}