// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppJsonModel _$AppJsonModelFromJson(Map<String, dynamic> json) => AppJsonModel(
      campus: json['campus'] == null
          ? null
          : Campus.fromJson(json['campus'] as Map<String, dynamic>),
      specialNotices: (json['specialNotices'] as List<dynamic>?)
          ?.map((e) => SpecialNotices.fromJson(e as Map<String, dynamic>))
          .toList(),
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => Galleries.fromJson(e as Map<String, dynamic>))
          .toList(),
      campusTimings: (json['campusTimings'] as List<dynamic>?)
          ?.map((e) => CampusTimings.fromJson(e as Map<String, dynamic>))
          .toList(),
      announcements: (json['announcements'] as List<dynamic>?)
          ?.map((e) => Announcements.fromJson(e as Map<String, dynamic>))
          .toList(),
      news: (json['news'] as List<dynamic>?)
          ?.map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => Events.fromJson(e as Map<String, dynamic>))
          .toList(),
      attractions: (json['attractions'] as List<dynamic>?)
          ?.map((e) => Attraction.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialMedia: (json['socialMedia'] as List<dynamic>?)
          ?.map((e) => SocialMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      lookups: json['lookups'] == null
          ? null
          : Lookups.fromJson(json['lookups'] as Map<String, dynamic>),
      guidelines: json['guidelines'] == null
          ? null
          : Guidelines.fromJson(json['guidelines'] as Map<String, dynamic>),
      accommodations: (json['accommodations'] as List<dynamic>?)
          ?.map((e) => Accommodations.fromJson(e as Map<String, dynamic>))
          .toList(),
      feedbackForm: json['feedbackForm'] == null
          ? null
          : FeedbackForm.fromJson(json['feedbackForm'] as Map<String, dynamic>),
      submitFeedback: json['submitFeedback'] == null
          ? null
          : SubmitFeedback.fromJson(
              json['submitFeedback'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppJsonModelToJson(AppJsonModel instance) =>
    <String, dynamic>{
      'campus': instance.campus,
      'specialNotices': instance.specialNotices,
      'galleries': instance.galleries,
      'campusTimings': instance.campusTimings,
      'announcements': instance.announcements,
      'news': instance.news,
      'events': instance.events,
      'attractions': instance.attractions,
      'lookups': instance.lookups,
      'guidelines': instance.guidelines,
      'socialMedia': instance.socialMedia,
      'accommodations': instance.accommodations,
      'feedbackForm': instance.feedbackForm,
      'submitFeedback': instance.submitFeedback,
    };
