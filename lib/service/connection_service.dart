
import 'package:injectable/injectable.dart';


abstract class IConnectionStatus {
  bool get connect;
  void setStatus(bool connection);
}

@Singleton(as: IConnectionStatus)
class ConnectionStatus implements IConnectionStatus {
  bool _connected = false;
  @override
  bool get connect => _connected;

  @override
  void setStatus(bool connection) {
    _connected = connection;
  }

}
