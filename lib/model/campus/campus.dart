import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'campus.g.dart';

@JsonSerializable()
class Campus extends Equatable{
  String? name;
  String? description;
  String? latitude;
  String? longitude;
  Address? address;
  List<ContactInfo>? contactInfo;

  Campus({
    this.name,
    this.description,
    this.latitude,
    this.longitude,
    this.address,
    this.contactInfo,
  });

  factory Campus.fromJson(Map<String, dynamic> json) => _$CampusFromJson(json);

  Map<String, dynamic> toJson() => _$CampusToJson(this);

  @override
  List<Object?> get props =>[name,
    description,
    latitude,
    longitude,
    address,
    contactInfo];
}

@JsonSerializable()
class Address extends Equatable {
  String? street;
  String? city;
  String? state;
  String? postal;

  Address({
    this.street,
    this.city,
    this.state,
    this.postal,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
  @override
  List<Object?> get props =>[street, city, state, postal];
}

@JsonSerializable()
class ContactInfo extends Equatable{
  String? type;
  String? title;
  String? value;

  ContactInfo({this.type, this.title, this.value});

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInfoToJson(this);
  @override
  List<Object?> get props =>[type, title, value];
}
