import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';

part 'content.g.dart';

@JsonSerializable()
class Content extends Equatable {
  int? order;
  String? text;
  String? videoUrl;
  List<String>? imageURL;

  Content({
    this.order,
    this.text,
    this.videoUrl,
    this.imageURL,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

  @override
  List<Object?> get props =>
      [ order,
        text,
        videoUrl,
        imageURL];

}
