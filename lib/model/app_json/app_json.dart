import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/model/feedback/submit_feedback.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../accommodations/accommodations.dart';
import '../announcements/announcements.dart';
import '../campus/campus.dart';
import '../campus_timing/campus_timing.dart';
import '../event/events.dart';
import '../feedback/feedback_form.dart';
import '../gallery/gallery.dart';
import '../guidelines/guidelines.dart';
import '../lookups/lookups.dart';
import '../news/news.dart';
import '../social_media/social_media.dart';
import '../special_notices/spacial_notices.dart';

part 'app_json.g.dart';

@JsonSerializable()
class AppJsonModel extends Equatable {
  Campus? campus;
  List<SpecialNotices>? specialNotices;
  List<Galleries>? galleries;
  List<CampusTimings>? campusTimings;
  List<Announcements>? announcements;
  List<News>? news;
  List<Events>? events;
  List<Attraction>? attractions;
  Lookups? lookups;
  Guidelines? guidelines;
  List<SocialMedia>? socialMedia;
  List<Accommodations>? accommodations;
  FeedbackForm? feedbackForm;
  SubmitFeedback? submitFeedback;

  AppJsonModel({
    this.campus,
    this.specialNotices,
    this.galleries,
    this.campusTimings,
    this.announcements,
    this.news,
    this.events,
    this.attractions,
    this.socialMedia,
    this.lookups,
    this.guidelines,
    this.accommodations,
    this.feedbackForm,
    this.submitFeedback,
  });

  factory AppJsonModel.fromJson(Map<String, dynamic> json) =>
      _$AppJsonModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppJsonModelToJson(this);

  @override
  List<Object?> get props => [campus,specialNotices,galleries,campusTimings,announcements,news,events,attractions,
    socialMedia,lookups,guidelines,accommodations,feedbackForm,submitFeedback];
}


/*class CampusTimings {
  int? id;
  String? name;
  String? description;
  String? type;
  List<Hours>? hours;

  CampusTimings({this.id,this.name, this.description, this.type, this.hours});

  CampusTimings.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    type = json['type'];
    if (json['hours'] != null) {
      hours = <Hours>[];
      json['hours'].forEach((v) {
        hours!.add(Hours.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['type'] = type;
    if (hours != null) {
      data['hours'] = hours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hours {
  String? weekday;
  double? startHour;
  double? endHour;

  Hours({this.weekday, this.startHour, this.endHour});

  Hours.fromJson(Map<String, dynamic> json) {
    weekday = json['weekday'];
    startHour = json['startHour'];
    endHour = json['endHour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weekday'] = weekday;
    data['startHour'] = startHour;
    data['endHour'] = endHour;
    return data;
  }
}

class Recognitions {
  String? title;
  String? details;
  String? createdAt;
  List<String>? images;

  Recognitions({this.title, this.details, this.createdAt, this.images});

  Recognitions.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    details = json['details'];
    createdAt = json['createdAt'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['details'] = details;
    data['createdAt'] = createdAt;
    data['images'] = images;
    return data;
  }
}

class SuggestedRoutes {
  String? title;
  String? description;
  List<int>? attractions;

  SuggestedRoutes({this.title, this.description, this.attractions});

  SuggestedRoutes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    attractions = json['attractions'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['attractions'] = attractions;
    return data;
  }
}*/
