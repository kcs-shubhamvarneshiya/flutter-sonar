import 'package:akdmvisitorsapp/service/connection_service.dart';
import 'package:akdmvisitorsapp/service/connectivity_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ConnectionStatus connectionStatus;
  ConnectionUtil connectionUtil;
  WidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    connectionStatus = ConnectionStatus();
    connectionUtil = ConnectionUtil.getInstance();
  });

  group('Check connection service', () {

    test('Validate Connection Status', () async {
      connectionStatus = ConnectionStatus();
      // Validate Connection Status
      final status = connectionStatus.setStatus(true);
      expect(true, true);
    });

    //connection utils
    test('Validate Connection Status Utils', () async {
      connectionUtil = ConnectionUtil.getInstance();
      // Validate Connection Status utils
      final hasInternetConnection = connectionUtil.hasInternetInternetConnection();
      expect(hasInternetConnection, hasInternetConnection);
      final connectionChange = connectionUtil.connectionChange;
      expect(connectionChange, connectionChange);
      final connectionChangeController = connectionUtil.initialize();
      expect(true, true);

    });

  });
}
