import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:geojson/geojson.dart';
import 'package:injectable/injectable.dart';

import '../model/remote_config.dart';
import '../model/video_url/video_url.dart';

@singleton
class RemoteConfig {
  FirebaseRemoteConfig config;
  SSOConfig ssoConfig;
  ApiConfig apiConfig;
  GeoJson routeGeoJson;
  GeoJson venueGeoJson;
  GeoJson boundaryGeoJson;
  VideoConfig videoConfig;

  RemoteConfig(this.config, this.ssoConfig, this.apiConfig, this.routeGeoJson,
      this.venueGeoJson, this.boundaryGeoJson, this.videoConfig);

  @FactoryMethod(preResolve: true)
  static Future<RemoteConfig> create(FirebaseRemoteConfig config) async {
    final ssoConfig = SSOConfig.fromJson(jsonDecode(config.getString('sso')));
    final apiConfig = ApiConfig.fromJson(jsonDecode(config.getString('api')));
    final routeGeoJson = GeoJson();
    await routeGeoJson.parse(config.getString('route_geojson'), verbose: false);
    final venueGeoJson = GeoJson();
    await venueGeoJson.parse(config.getString('venue_geojson'), verbose: false);
    final boundaryGeoJson = GeoJson();
    await boundaryGeoJson.parse(config.getString('boundary_geojson'),
        verbose: false);
    final videoConfig =
        VideoConfig.fromJson(jsonDecode(config.getString('video')));

    return RemoteConfig(config, ssoConfig, apiConfig, routeGeoJson,
        venueGeoJson, boundaryGeoJson, videoConfig);
  }
}
