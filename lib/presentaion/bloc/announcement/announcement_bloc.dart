import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AnnouncementsBloc extends Cubit<int> {
  AnnouncementsBloc() : super(0);

  void startDisplayingData() {
    Future.delayed(const Duration(seconds: 5), () {
      emit(state + 1);
      startDisplayingData();
    });
  }
}
