

import 'package:akdmvisitorsapp/utils/custome_scroll_physics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomScrollPhysics Test', () {
    test('applyPhysicsToUserOffset should set isGoingLeft correctly', () {
      final scrollPhysics = CustomScrollPhysics();
      final position = FixedScrollMetrics(
        pixels: 100.0,
        minScrollExtent: 0.0,
        maxScrollExtent: 200.0,
        viewportDimension: 0,
        axisDirection:AxisDirection.right,
        devicePixelRatio: 0,
      );

      final newOffset = scrollPhysics.applyPhysicsToUserOffset(position, -10.0);

      expect(newOffset, -10.0);
      expect(scrollPhysics.isGoingLeft, true);
    });

    test('applyBoundaryConditions should adjust value correctly', () {
      final scrollPhysics = CustomScrollPhysics();
      final position = FixedScrollMetrics(
        pixels: 100.0,
        minScrollExtent: 0.0,
        maxScrollExtent: 200.0,
        viewportDimension: 0,
        axisDirection:AxisDirection.right,
        devicePixelRatio: 0,
      );

      final newValue1 = scrollPhysics.applyBoundaryConditions(position, -10.0);
      final newValue2 = scrollPhysics.applyBoundaryConditions(position, 250.0);

      expect(newValue1, -100.0);
      expect(newValue2, 50.0);
    });
  });
}