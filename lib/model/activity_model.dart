class ActivityModel {
  int? id;
  String? image;
  String? title;
  String? time;
  String? description;

  ActivityModel({this.id, this.image, this.title, this.time, this.description});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    time = json['time'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['time'] = time;
    data['description'] = description;
    return data;
  }
}
