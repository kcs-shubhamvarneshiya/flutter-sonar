
import 'package:freezed_annotation/freezed_annotation.dart';
part 'video_url.g.dart';

@JsonSerializable()
class VideoConfig {
  List<String> urls;

  VideoConfig(this.urls);

  factory VideoConfig.fromJson(Map<String, dynamic> json) => _$VideoConfigFromJson(json);
  Map<String, dynamic> toJson() => _$VideoConfigToJson(this);
}
