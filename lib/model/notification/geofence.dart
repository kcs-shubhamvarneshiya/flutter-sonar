
class GeofenceModel {
  List<GeofenceList>? geofenceList;

  GeofenceModel({
    this.geofenceList,
  });

  factory GeofenceModel.fromJson(Map<String, dynamic> json) => GeofenceModel(
    geofenceList: json["geofenceList"] == null ? [] : List<GeofenceList>.from(json["geofenceList"]!.map((x) => GeofenceList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "geofenceList": geofenceList == null ? [] : List<dynamic>.from(geofenceList!.map((x) => x.toJson())),
  };
}

class GeofenceList {
  String? notificationId;
  String? id;
  String? notificationTitle;
  String? notificationDesc;
  String? radius;
  String? latitude;
  String? longitude;
  String? deepLink;
  bool? isEntry;
  bool? isExit;

  GeofenceList({
    this.notificationId,
    this.id,
    this.notificationTitle,
    this.notificationDesc,
    this.radius,
    this.latitude,
    this.longitude,
    this.deepLink,
    this.isEntry,
    this.isExit,
  });

  factory GeofenceList.fromJson(Map<String, dynamic> json) => GeofenceList(
    notificationId: json["notificationId"],
    id: json["id"],
    notificationTitle: json["notificationTitle"],
    notificationDesc: json["notificationDesc"],
    radius: json["radius"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    deepLink: json["deepLink"],
    isEntry: json["isEntry"],
    isExit: json["isExit"],
  );

  Map<String, dynamic> toJson() => {
    "notificationId": notificationId,
    "id": id,
    "notificationTitle": notificationTitle,
    "notificationDesc": notificationDesc,
    "radius": radius,
    "latitude": latitude,
    "longitude": longitude,
    "deepLink": deepLink,
    "isEntry": isEntry,
    "isExit": isExit,
  };
}