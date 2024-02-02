// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i13;
import 'package:firebase_core/firebase_core.dart' as _i15;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i16;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i21;
import 'package:shared_preferences/shared_preferences.dart' as _i25;

import 'core/api_client.dart' as _i4;
import 'dependencies.dart' as _i42;
import 'graphql/graphql_config.dart' as _i30;
import 'init_beacon.dart' as _i38;
import 'notification/fcm_notification_service.dart' as _i36;
import 'presentaion/bloc/announcement/announcement_bloc.dart' as _i3;
import 'presentaion/bloc/app_json/app_json_bloc.dart' as _i5;
import 'presentaion/bloc/attraction_filter_bloc/attraction_filter_bloc.dart'
    as _i35;
import 'presentaion/bloc/bluetooth_headset/bluetooth_headset_bloc.dart' as _i8;
import 'presentaion/bloc/bottombar_bloc/bottombar_bloc.dart' as _i9;
import 'presentaion/bloc/common_slider_image_bloc/common_image_slider_bloc.dart'
    as _i11;
import 'presentaion/bloc/connection/connection_bloc.dart' as _i12;
import 'presentaion/bloc/feedback_component/feedback_component_bloc.dart'
    as _i14;
import 'presentaion/bloc/guideline/guideline_bloc.dart' as _i18;
import 'presentaion/bloc/introduction/introduction_bloc.dart' as _i20;
import 'presentaion/bloc/login_bloc/login_bloc.dart' as _i31;
import 'presentaion/bloc/notification_bloc/notification_bloc.dart' as _i22;
import 'presentaion/bloc/notification_bloc/notification_service.dart' as _i23;
import 'presentaion/bloc/play_song/play_song_bloc.dart' as _i7;
import 'presentaion/bloc/splash_screen/splash_bloc.dart' as _i26;
import 'presentaion/bloc/submit_feedback/submit_feedback_bloc.dart' as _i39;
import 'presentaion/bloc/visit_bloc/visit_bloc.dart' as _i40;
import 'presentaion/bloc/visit_bloc/visit_service.dart' as _i41;
import 'presentaion/bloc/webView/webPageErrorBloc.dart' as _i29;
import 'presentaion/check_path/check_path_bloc.dart' as _i10;
import 'presentaion/indoorMap/logic/map_routing_provider.dart' as _i32;
import 'repository/app_json_repository.dart' as _i33;
import 'repository/appjson_repository_impl.dart' as _i34;
import 'repository/feedback_repo.dart' as _i37;
import 'repository/feedback_repo_impl.dart' as _i27;
import 'repository/validate_api_impl.dart' as _i28;
import 'router_page/app_router.dart' as _i6;
import 'service/connection_service.dart' as _i19;
import 'service/remote_config.dart' as _i24;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AnnouncementsBloc>(() => _i3.AnnouncementsBloc());
    gh.factory<_i4.ApiClient>(() => registerModule.apiClient);
    gh.factory<_i5.AppJsonAPIBloc>(() => _i5.AppJsonAPIBloc());
    gh.singleton<_i6.AppRouter>(_i6.AppRouter());
    gh.factory<_i7.AudioPlayerBloc>(() => _i7.AudioPlayerBloc());
    gh.factory<_i8.BluetoothHeadsetBloc>(() => _i8.BluetoothHeadsetBloc());
    gh.factory<_i9.BottomBarBloc>(() => _i9.BottomBarBloc());
    gh.factory<_i10.CheckExistPathBloc>(() => _i10.CheckExistPathBloc());
    gh.factory<_i11.CommonImageSliderBloc>(() => _i11.CommonImageSliderBloc());
    gh.factory<_i12.ConnectionBloc>(() => _i12.ConnectionBloc());
    gh.factory<_i13.Dio>(() => registerModule.dio);
    gh.factory<_i14.FeedbackComponentBloc>(() => _i14.FeedbackComponentBloc());
    await gh.factoryAsync<_i15.FirebaseApp>(
      () => registerModule.firebaseApp,
      preResolve: true,
    );
    await gh.factoryAsync<_i16.FirebaseRemoteConfig>(
      () => registerModule.getRemoteConfig(gh<_i15.FirebaseApp>()),
      preResolve: true,
    );
    gh.factory<_i17.FlutterLocalNotificationsPlugin>(
        () => registerModule.flutterLocalNotificationsPlugin);
    gh.factory<_i18.GuidelineBloc>(() => _i18.GuidelineBloc());
    gh.singleton<_i19.IConnectionStatus>(_i19.ConnectionStatus());
    gh.factory<_i20.IntroductionBloc>(() => _i20.IntroductionBloc());
    gh.factory<_i21.Logger>(() => registerModule.logger);
    gh.factory<_i22.NotificationBloc>(() => _i22.NotificationBloc());
    gh.factory<_i23.NotificationService>(() => _i23.NotificationServiceImpl());
    await gh.singletonAsync<_i24.RemoteConfig>(
      () => _i24.RemoteConfig.create(gh<_i16.FirebaseRemoteConfig>()),
      preResolve: true,
    );
    await gh.factoryAsync<_i25.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i26.SplashBloc>(
        () => _i26.SplashBloc(gh<_i25.SharedPreferences>()));
    gh.factory<_i27.SubmitFeedbackModelImpl>(
        () => _i27.SubmitFeedbackModelImpl());
    gh.factory<_i28.ValidateApiRepository>(
        () => _i28.ValidateApiRepositoryImpl(gh<_i4.ApiClient>()));
    gh.factory<_i29.WebViewErrorBloc>(() => _i29.WebViewErrorBloc());
    gh.singleton<_i30.GraphQLConfig>(_i30.GraphQLConfig(
      gh<_i25.SharedPreferences>(),
      gh<_i24.RemoteConfig>(),
    ));
    gh.factory<_i31.LoginBloc>(
        () => _i31.LoginBloc(gh<_i28.ValidateApiRepository>()));
    gh.singleton<_i32.MapRoutingProvider>(_i32.MapRoutingProvider(
      gh<_i24.RemoteConfig>(),
      gh<_i21.Logger>(),
    ));
    gh.factory<_i33.AppJsonRepository>(
        () => _i33.AppJsonRepository(gh<_i30.GraphQLConfig>()));
    gh.factory<_i34.AppJsonService>(() => _i34.AppJsonModelImpl(
          gh<_i33.AppJsonRepository>(),
          gh<_i25.SharedPreferences>(),
        ));
    gh.factory<_i35.AttractionFilterBloc>(
        () => _i35.AttractionFilterBloc(gh<_i33.AppJsonRepository>()));
    gh.singleton<_i36.FcmNotificationService>(_i36.FcmNotificationService(
      gh<_i17.FlutterLocalNotificationsPlugin>(),
      gh<_i33.AppJsonRepository>(),
    ));
    gh.factory<_i37.FeedbackRepo>(
        () => _i37.FeedbackRepo(gh<_i30.GraphQLConfig>()));
    gh.singleton<_i38.InitBeacon>(
        _i38.InitBeacon(gh<_i33.AppJsonRepository>()));
    gh.factory<_i39.SubmitFeedbackBloc>(() => _i39.SubmitFeedbackBloc(
          gh<_i27.SubmitFeedbackModelImpl>(),
          gh<_i37.FeedbackRepo>(),
          gh<_i25.SharedPreferences>(),
        ));
    gh.factory<_i40.VisitBloc>(
        () => _i40.VisitBloc(gh<_i33.AppJsonRepository>()));
    gh.factory<_i41.VisitService>(
        () => _i41.VisitServiceImpl(gh<_i33.AppJsonRepository>()));
    gh.factory<_i5.AppJsonBloc>(
        () => _i5.AppJsonBloc(gh<_i33.AppJsonRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i42.RegisterModule {}
