//import 'package:akdmvisitorsapp/di/injection.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/announcement/announcement_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('AnnouncementsBloc', () {
    blocTest<AnnouncementsBloc, int>(
      'emits incremented state after a delay',
      build: () => AnnouncementsBloc(),
      act: (bloc) => bloc.startDisplayingData(),
      wait: const Duration(seconds: 5),
      expect: () => const <int>[1],
      verify: (_) {
      },
    );
  });
}