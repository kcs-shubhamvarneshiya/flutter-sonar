import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends Equatable {
  String? title;
  String? publishedAt;
  String? author;
  String? thumbnail;
  String? heroImage;
  List<String>? gallery;
  String? file;
  String? description;
  String? extraText;
  List<String>? tags;
  List<String>? categories;
  String? externalLink;

  News({
    this.title,
    this.publishedAt,
    this.author,
    this.thumbnail,
    this.heroImage,
    this.gallery,
    this.file,
    this.description,
    this.extraText,
    this.tags,
    this.categories,
    this.externalLink,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  @override
  List<Object?> get props => [];
}
