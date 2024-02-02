import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_media.g.dart';

@JsonSerializable()
class SocialMedia {
  String? type;
  String? link;
  String? handle;
  String? date;
  String? description;
  String? thumbnail;
  String? profileImage;

  SocialMedia({
    this.type,
    this.link,
    this.handle,
    this.date,
    this.description,
    this.thumbnail,
    this.profileImage,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaToJson(this);
}
