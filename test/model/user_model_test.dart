import 'dart:convert';
import 'dart:io';
import 'package:akdmvisitorsapp/model/user_model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //to create the user Model

  final userModel = UserModel(
      id:"1234567890",
      requestorid:"9876543210",
      resourceuri:"/api/v1/users",
      additionalinfo:"This is additional information.",
      nonce:"abcdef0123456789",
      uid:"1234567890",
      sid:"9876543210",
      aid:"1234567890",
      cid:"9876543210",
      auth:"bearer",
      fn:"John",
      ln:"Doe",
      pid:"1234567890",
      ct:"1234567890",
      role:"admin",
      nbf:1597470000,
      exp:1628934000,
      iat:1597469400,
      iss:"https://example.com",
      aud:"https://api.example.com"
  );

  final usersModel = userModel;
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      var dir = Directory.current.path;
      var currentPath = File('$dir/test/json/user_model_test.json').readAsStringSync();
      final Map<String, dynamic> jsonMap = json.decode(currentPath);
      // act
      final result = UserModel.fromJson(jsonMap);
      // assert
      expect(result.toJson(), usersModel.toJson());
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange
      // act
      final result = usersModel;
      // assert

      final expectedJsonMap = {
        "userModel": {
          "id": "1234567890",
          "requestorid": "9876543210",
          "resourceuri": "/api/v1/users",
          "additionalinfo": "This is additional information.",
          "nonce": "abcdef0123456789",
          "uid": "1234567890",
          "sid": "9876543210",
          "aid": "1234567890",
          "cid": "9876543210",
          "auth": "bearer",
          "fn": "John",
          "ln": "Doe",
          "pid": "1234567890",
          "ct": "1234567890",
          "role": "admin",
          "nbf": 1597470000,
          "exp": 1628934000,
          "iat": 1597469400,
          "iss": "https://example.com",
          "aud": "https://api.example.com"
        }
      };
      expect(result.toJson(), expectedJsonMap['userModel']);
    });
  });
}
