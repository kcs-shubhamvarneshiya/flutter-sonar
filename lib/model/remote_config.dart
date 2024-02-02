import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config.g.dart';

@JsonSerializable()
class ApiConfig {
  String baseUrl;
  String headerSecretKey;
  String headerSecretValue;

  ApiConfig(this.baseUrl, this.headerSecretKey, this.headerSecretValue);

  factory ApiConfig.fromJson(Map<String, dynamic> json) => _$ApiConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ApiConfigToJson(this);

}

@JsonSerializable()
class SSOConfig {
  String baseUrl;

  SSOConfig(this.baseUrl);

  factory SSOConfig.fromJson(Map<String, dynamic> json) => _$SSOConfigFromJson(json);
  Map<String, dynamic> toJson() => _$SSOConfigToJson(this);
}