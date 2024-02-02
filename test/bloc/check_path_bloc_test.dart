import 'dart:io';
import 'dart:typed_data';
import 'package:akdmvisitorsapp/presentaion/check_path/check_path_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/check_path/check_path_exist_event.dart';
import 'package:akdmvisitorsapp/presentaion/check_path/check_path_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockDirectory extends Mock implements Directory {
  @override
  Future<Directory> create({bool recursive = false}) async {
    // Mock the creation of a directory, you can customize as needed.
    return this;
  }

  @override
  Future<bool> exists() async {
    return true; // Change to false if you want to simulate a non-existing file.
  }
}

class MockFile extends Mock implements File {
  @override
  Future<Uint8List> readAsBytes() async {
    return Uint8List(0);
  }

  @override
  Future<File> writeAsBytes(List<int> bytes, {FileMode mode = FileMode.write, bool flush = false}) async {
    return this;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CheckExistPathBloc', () {

    blocTest<CheckExistPathBloc, CheckPathAvailableState>(
      'emits true when the path exists',
      build: ()  {
        return CheckExistPathBloc();
      },
      act: (bloc) => bloc.add(const CheckPathExistEvent.exist()),
      expect: () => const <CheckPathAvailableState>[CheckPathAvailableState(value: true)],
    );


    blocTest<CheckExistPathBloc, CheckPathAvailableState>(
      'emits false when the path does not exist',
      build: () => CheckExistPathBloc(),
      act: (bloc) => bloc.add(const CheckPathExistEvent.exist()),
      expect: () => const <CheckPathAvailableState>[CheckPathAvailableState(value: false)],
    );

  });
}
