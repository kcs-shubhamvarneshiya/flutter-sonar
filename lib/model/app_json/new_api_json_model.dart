import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../read_file/read_file_from_s3.dart';

part 'new_api_json_model.g.dart';

@JsonSerializable()
class AppJsonApiModel extends Equatable{
  ReadFileFromS3? readFileFromS3;

  AppJsonApiModel({this.readFileFromS3});

  factory AppJsonApiModel.fromJson(Map<String, dynamic> json) => _$AppJsonApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppJsonApiModelToJson(this);

  @override
  List<Object?> get props => [readFileFromS3];

  AppJsonApiModel toEntity() {
    return AppJsonApiModel(readFileFromS3: readFileFromS3);
  }
}


