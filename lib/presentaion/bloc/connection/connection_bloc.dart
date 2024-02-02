

import 'package:akdmvisitorsapp/presentaion/bloc/connection/connection_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/connection/connection_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import '../../../service/connection_service.dart';

@injectable
class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
   IConnectionStatus? connectionStatus;
   ConnectionBloc() : connectionStatus = getIt<IConnectionStatus>(),super(const ConnectionState(false)){
    on<ConnectionCheck>((event,emit) {
      connectionStatus!.setStatus(event.connectionStatus);
      emit(ConnectionState(connectionStatus!.connect));
    });
  }

}
