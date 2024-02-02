import 'package:akdmvisitorsapp/service/connection_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ConnectionStatus', () {
    test('initial connection status should be false', () {
      final connectionStatus = ConnectionStatus();
      expect(connectionStatus.connect, false);
    });

    test('set connection status to true', () {
      final connectionStatus = ConnectionStatus();
      connectionStatus.setStatus(true);
      expect(connectionStatus.connect, true);
    });

    test('set connection status to false', () {
      final connectionStatus = ConnectionStatus();
      connectionStatus.setStatus(true); // Set to true initially
      connectionStatus.setStatus(false); // Set to false
      expect(connectionStatus.connect, false);
    });
  });
}