import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'content.dart';
part 'section.g.dart';

@JsonSerializable()
class Section extends Equatable{
  String? title;
  String? imageURL;
  List<Content>? content;

  Section({
    this.title,
    this.imageURL,
    this.content,
  });

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);

  Map<String, dynamic> toJson() => _$SectionToJson(this);

  @override
  List<Object?> get props =>[ title,
    imageURL,
    content,];
}