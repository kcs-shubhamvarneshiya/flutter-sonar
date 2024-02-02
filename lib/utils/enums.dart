
//notification type
enum NotificationType { LOCAL, GEOFENCE, BEACON, FCM }

//introduction background type
enum Background { Light, Dark }

//social media types
enum SocialMediaType {
  YOUTUBE,
  FACEBOOK,
  TWITTER,
  INSTAGRAM,
}

//announcement priority types
enum priorityType {
  INFO,
  WARNING,
  ERROR,
  SUCCESS
}

//submit_feedback from feild types
enum FieldType {
  textBox,
  radio,
  multiSelectDropdown,
  dropdown,
  checkBox,
  textArea
}

//gallery types
enum GalleryType {
  IMAGE,
  YOUTUBE,
  VIMEO
}

enum GalleryModuleType {
  Homepage,
  Visit
}

//geofence types
enum GeoFenceNotifyType{
  ON_CAMPUS,
  OFF_CAMPUS,
  ALL
}

// Notification Types for Deeplink
enum NotificationTypeForRedirection{
  attraction,
  campus,
  push
}

// Notification Types for Deeplink
enum UtilityAttractionType{
  facilities,
  parking
}
//contact info type
enum ContactType{
  tel,
  email
}