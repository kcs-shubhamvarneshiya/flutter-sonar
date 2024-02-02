import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery.g.dart';

@JsonSerializable()
class Galleries extends Equatable {
  int? id;
  String? title;
  String? description;
  List<Media>? media;

  Galleries({
    this.id,
    this.title,
    this.description,
    this.media,
  });

  factory Galleries.fromJson(Map<String, dynamic> json) =>
      _$GalleriesFromJson(json);

  Map<String, dynamic> toJson() => _$GalleriesToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        media,
      ];
}

@JsonSerializable()
class Media extends Equatable {
  String? type;
  String? name;
  String? captions;
  String? src;
  String? thumbnail;

  Media({
    this.type,
    this.name,
    this.captions,
    this.src,
    this.thumbnail,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);

  @override
  List<Object?> get props => [
        type,
        name,
        captions,
        src,
        thumbnail,
      ];
}
