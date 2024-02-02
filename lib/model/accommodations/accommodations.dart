import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accommodations.g.dart';

@JsonSerializable()
class Accommodations extends Equatable{
  int? id;
  String? name;
  String? location;
  int? price;
  String? link;
  String? thumbnail;

  Accommodations({
    this.id,
    this.name,
    this.location,
    this.price,
    this.link,
    this.thumbnail,
  });

  factory Accommodations.fromJson(Map<String, dynamic> json) =>
      _$AccommodationsFromJson(json);

  Map<String, dynamic> toJson() => _$AccommodationsToJson(this);

  @override
   List<Object?> get props => [];
}
