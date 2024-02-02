import 'package:akdmvisitorsapp/core/api_client.dart';
import 'package:akdmvisitorsapp/repository/validate_api_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:async/src/result/result.dart';
import 'package:mockito/mockito.dart';

class MockApiClient extends Mock implements ApiClient {
  @override
  Future<int> logout() {
    return Future(() => 400); //add 400 for fail the case.
  }

  @override
  Future<int> validate() {
    return Future(() => 200); //add 400 for fail the case.
  }
}

GetIt sl = GetIt.instance;

Future<void> setupGetIt(MockApiClient mockApiClient,) async {
  sl.registerSingleton<ApiClient>(mockApiClient);
}


void main() {
  group('ValidateApiRepositoryImpl', () {
    late ValidateApiRepository validateApiRepository;
    final mockApiClient = MockApiClient();
    setupGetIt(mockApiClient);

    setUp(() {
      validateApiRepository = ValidateApiRepositoryImpl(mockApiClient);
    });

    test('getToken returns Result.value(true)', () async {
      // Act
      final result = await validateApiRepository.getToken();
      // Assert
      expect(result, isA<Result<bool>>());
      expect(result.asValue?.value, isTrue); //200 code for pass.
    });

    test('getToken returns Result.error(false)', () async {
      // Act
      final result = await validateApiRepository.getToken();

      // Assert
      expect(result, isA<Result<bool>>());
      expect(result.asError?.error, isFalse); //400 code for fail.
    });

    test('getLogout returns Result.value(true)', () async {
      // Act
      final result = await validateApiRepository.getLogout();
      // Assert
      expect(result, isA<Result<bool>>());
      expect(result.asValue!.value, isTrue);
    });

    test('getLogout returns Result.value(false) on exception', () async {
      // Act
      final result = await validateApiRepository.getLogout();
      // Assert
      expect(result, isA<Result<bool>>());
      expect(result.asError?.error, isFalse);
    });

  });

}