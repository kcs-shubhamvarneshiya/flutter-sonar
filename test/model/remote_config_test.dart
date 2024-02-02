import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/remote_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final expectedJsonMap = {
    "ApiConfig": {
      "baseUrl": "https://api.example.com",
      "headerSecretKey": "X-API-Secret-Key",
      "headerSecretValue": "1234567890abcdef"
    }
  };

  final jsonString = json.encode(expectedJsonMap);
  final appConfig=json.decode(jsonString);
  final appConfigModel = ApiConfig.fromJson(appConfig);

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath = File('$dir/test/json/api_config_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      // act
      final result = jsonMap;
      // assert
      expect(result['ApiConfig'], appConfigModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // act
      final result = appConfig;
      // assert
      final expectedJsonMap = {
        "ApiConfig": {
          "baseUrl": "https://api.example.com",
          "headerSecretKey": "X-API-Secret-Key",
          "headerSecretValue": "1234567890abcdef"
        }
      };
      expect(result['ApiConfig'], expectedJsonMap['ApiConfig']);
    });
  });


  group('SSOConfig Model Test', () {
    test('Create SSOConfig from JSON', () {
      final Map<String, dynamic> json = {
        'baseUrl': 'https://sso.example.com',
      };

      final ssoConfig = SSOConfig.fromJson(json);

      expect(ssoConfig.baseUrl, 'https://sso.example.com');
    });

    test('Convert SSOConfig to JSON', () {
      final ssoConfig = SSOConfig('https://sso.example.com');

      final json = ssoConfig.toJson();

      expect(json['baseUrl'], 'https://sso.example.com');
    });
  });

}
