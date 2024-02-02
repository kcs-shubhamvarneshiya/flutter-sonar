
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_json/app_json.dart';

part 'read_file_from_s3.g.dart';

@JsonSerializable()
class ReadFileFromS3 extends Equatable{
  AppJsonModel? file;
  String? message;

  ReadFileFromS3({this.file, this.message});

  factory ReadFileFromS3.fromJson(Map<String, dynamic> json) => _$ReadFileFromS3FromJson(json);

  Map<String, dynamic> toJson() =>_$ReadFileFromS3ToJson(this);

  @override
  List<Object?> get props => [file,message];
}