import 'package:akdmvisitorsapp/model/guidelines/section.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guidelines.g.dart';

@JsonSerializable()
class Guidelines extends Equatable{
  String? image;
  String? description;
  String? link;
  List<Section>? sections;

  Guidelines({
    this.image,
    this.description,
    this.link,
    this.sections,
  });

  factory Guidelines.fromJson(Map<String, dynamic> json) =>
      _$GuidelinesFromJson(json);

  Map<String, dynamic> toJson() => _$GuidelinesToJson(this);

  @override
  List<Object?> get props =>[ image,
    description,
    link,];
}
