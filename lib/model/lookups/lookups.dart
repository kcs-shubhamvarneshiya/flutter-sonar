
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lookups.g.dart';

@JsonSerializable()
class Lookups extends Equatable {
  String? aboutUs;
  String? donate;
  String? visitorGuidelines;
  String? glossary;
  String? privacyPolicy;
  String? termsConditions;
  String? socialYoutubeLink;
  String? socialInstagramLink;
  String? socialFacebookLink;
  String? socialTwitterLink;
  String? uberDeeplink;
  String? lyftDeeplink;
  String? shayonaCafe;
  String? giftShop;
  String? yourTickets;
  String? bookedTours;

  Lookups({
    this.aboutUs,
    this.donate,
    this.visitorGuidelines,
    this.glossary,
    this.privacyPolicy,
    this.termsConditions,
    this.socialYoutubeLink,
    this.socialInstagramLink,
    this.socialFacebookLink,
    this.socialTwitterLink,
    this.uberDeeplink,
    this.lyftDeeplink,
    this.shayonaCafe,
    this.giftShop,
    this.yourTickets,
    this.bookedTours,
  });

  factory Lookups.fromJson(Map<String, dynamic> json) =>
      _$LookupsFromJson(json);

  Map<String, dynamic> toJson() => _$LookupsToJson(this);

  @override
  List<Object?> get props => [aboutUs,donate,visitorGuidelines,glossary,privacyPolicy,termsConditions,socialYoutubeLink,socialInstagramLink,
    socialFacebookLink,socialTwitterLink,uberDeeplink,lyftDeeplink,shayonaCafe,giftShop,yourTickets,bookedTours];

}
