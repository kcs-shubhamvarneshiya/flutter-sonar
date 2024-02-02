import 'package:akdmvisitorsapp/core/api_client.dart';
import 'package:akdmvisitorsapp/core/dio_client.dart';
import 'package:akdmvisitorsapp/notification/fcm_notification_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dependencies.config.dart';
import 'firebase_options.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<GetIt> configureDependencies(String environment) =>
    getIt.init(environment: environment);

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  Dio get dio => getDio();
  @preResolve
  Future<FirebaseApp> get firebaseApp =>
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  @preResolve
  Future<FirebaseRemoteConfig> getRemoteConfig(FirebaseApp app) async {
    final config = FirebaseRemoteConfig.instanceFor(app: app);
    await config.fetchAndActivate();
    return config;
  }

  ApiClient get apiClient => ApiClient(dio);
  FlutterLocalNotificationsPlugin get flutterLocalNotificationsPlugin =>
      FlutterLocalNotificationsPlugin();
  Logger get logger => Logger();
}
