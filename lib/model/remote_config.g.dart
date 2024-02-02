// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiConfig _$ApiConfigFromJson(Map<String, dynamic> json) => ApiConfig(
      json['baseUrl'] as String,
      json['headerSecretKey'] as String,
      json['headerSecretValue'] as String,
    );

Map<String, dynamic> _$ApiConfigToJson(ApiConfig instance) => <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'headerSecretKey': instance.headerSecretKey,
      'headerSecretValue': instance.headerSecretValue,
    };

SSOConfig _$SSOConfigFromJson(Map<String, dynamic> json) => SSOConfig(
      json['baseUrl'] as String,
    );

Map<String, dynamic> _$SSOConfigToJson(SSOConfig instance) => <String, dynamic>{
      'baseUrl': instance.baseUrl,
    };
