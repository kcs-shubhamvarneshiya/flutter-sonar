import 'package:freezed_annotation/freezed_annotation.dart';

part 'spacial_notices.g.dart';

@JsonSerializable()
class SpecialNotices {
  Audio? audio;
  String? image;
  String? title;
  Video? video;
  List<Details>? details;
  String? description;
  int? id;

  SpecialNotices({
    this.audio,
    this.image,
    this.title,
    this.video,
    this.details,
    this.description,
    this.id,
  });

  factory SpecialNotices.fromJson(Map<String, dynamic> json) =>
      _$SpecialNoticesFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialNoticesToJson(this);
}

class Audio {
  String? audioUrl;
  String? audioTitle;

  Audio({this.audioUrl, this.audioTitle});

  Audio.fromJson(Map<String, dynamic> json) {
    audioUrl = json['audio_url'];
    audioTitle = json['audio_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['audio_url'] = audioUrl;
    data['audio_title'] = audioTitle;
    return data;
  }
}

class Video {
  String? itemUrl;
  String? itemThumbnail;

  Video({this.itemUrl, this.itemThumbnail});

  Video.fromJson(Map<String, dynamic> json) {
    itemUrl = json['item_url'];
    itemThumbnail = json['item_thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_url'] = itemUrl;
    data['item_thumbnail'] = itemThumbnail;
    return data;
  }
}

class Details {
  String? detailText;
  String? detailType;

  Details({this.detailText, this.detailType});

  Details.fromJson(Map<String, dynamic> json) {
    detailText = json['detail_text'];
    detailType = json['detail_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detail_text'] = detailText;
    data['detail_type'] = detailType;
    return data;
  }
}
