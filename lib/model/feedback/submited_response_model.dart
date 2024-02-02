import 'package:freezed_annotation/freezed_annotation.dart';

part 'submited_response_model.g.dart';

@JsonSerializable()
class FeedBackResponseModel {
  String? createFeedbackRecord;

  FeedBackResponseModel({this.createFeedbackRecord});

  FeedBackResponseModel.fromJson(Map<String, dynamic> json) {
    createFeedbackRecord = json['createFeedbackRecord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createFeedbackRecord'] = createFeedbackRecord;
    return data;
  }
  FeedBackResponseModel toEntity(String createFeedbackRecord) {
    return FeedBackResponseModel(createFeedbackRecord: createFeedbackRecord);
  }
}