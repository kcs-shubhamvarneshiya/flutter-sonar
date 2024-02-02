import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Constant {
  //API Constants
  //static const String serverAPIURL = "http://phpdemo03.kcspl.in:9006/api"; //DEV Env
  //static const String serverAPIURL = "http://phpdemo03.kcspl.in:9007/api"; //QA Env
  // static const String serverAPIURL = "http://bapsvisitoradmin-stage.kcspl.in:9008/api"; //STAGE Env - For BAPS Team Review
  // static const String headerSecret="secret";
  // static const String secretValue="e08f42be-03cd-4960-bc2c-0f00a441d2c3";
  static const String headerUserId = "userId";
  static const String deviceToken = "deviceToken";

  //SSO Constants
  // static const String serverApiRestUrl = "https://api.uat.bapsapps.org/sso/api/";
  // static const String validateUrl = "$serverApiRestUrl/serverApiRestUrl";

  //Notification Constants
  static const String channelName = "geofence_connect";
  static const String getGeofenceMethod = "setGeofence";
  static const String getGeofenceListMethod = "setMultipleGeofence";
  static const String notificationChannelId = "notification_channel";
  static const String notificationChannelName = "notification_channel_name";
  static const String channelDescription = "channel_description";
  static const String notificationTitle = "Visit Notify";
  static const String geofenceSubscribe = "GEOFENCE_SUBSCRIBE";
  static const String geofenceUnSubscribe = "GEOFENCE_UNSUBSCRIBE";
  static const String geofenceNotificationReceived =
      "geofenceNotificationReceived";
  static const String jsonAppContentFileName = "akdm_visitor_app_content.json";
  static const String campusEntryId = "akdm_entry_notification_id";
  static const String campusExitId = "akdm_exit_notification_id";

  //DeepLinking Constants for Dynamic Link (Firebase)
  static const String dynamicLinkPrefix = "https://akdmve.page.link";
  static const String dynamicLink = "https://akdmve.page.link/attractions/";
  static const String androidPackageName = "org.baps.na.akdmve";
  // static const String androidPackageName = "com.example.akdmvisitorsapp";
  static const String iOSPackageName = "org.baps.na.akdmve";

  //ScreenTypeConstants
  static const String homeScreen = "HOME";
  static const String mapScreen = "MAP";
  static const String visitScreen = "VISIT";
  static const String moreScreen = "MORE";
  static const String attractionScreen = "ATTRACTION";
  static const String notificationScreen = "NOTIFICATION";

  //Date formats
  static const WEBAPI_DATE_FORMAT = "hh:mm:ss";
  static const DISPLAY_POST_DATE = "hh:mm a ";
  static const WEB_DATE_FORMAT = "hh.mm";
  static const ISO_TIMEZONE = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static const ISO_TIMEZONE_TWO = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS";
  static const NEW_DATE_FORMAT = "MM/dd/yyyy";
  static const EVENT_DATE_FORMAT = "dd MMM yyyy";

  static const attractionItemCount = 5;
  static const itemCount = 3;

  //MapTile Instance Id
  //static const indoorMapURL = "https://r2.psm100.org/nagarmap/V1/{z}/{x}/{y}.png";
  static const indoorMapURL =
      "https://static.baps-apps.org/akdm/map/{z}/{x}/{y}.png";
  static const indoorMapInstance = "indoorMapInstance";
  static const videoUrlOne =
      "https://cdn.baps-webnext-akshardham.org/media/explore/hero-intro-1.mp4";
  static const videoUrlTwo =
      "https://cdn.baps-webnext-akshardham.org/media/explore/hero-intro-2.mp4";
  static const videoUrlThree =
      "https://cdn.baps-webnext-akshardham.org/media/explore/hero-intro-3.mp4";
  static const videoUrlFour =
      "https://cdn.baps-webnext-akshardham.org/media/explore/hero-intro-4.mp4";
  static const videoUrlFive =
      "https://cdn.baps-webnext-akshardham.org/media/explore/hero-intro-5.mp4";
  static String currentVideoUrl = Constant.videoUrlOne;
  static String contactMediaTitle = "For press and media inquiries, email";

  //Refer A Friend App Store Link
  static const androidPlayStoreURL =
      "https://play.google.com/store/apps/details?id=org.baps.na.akdmve";
  static const iOSAppStoreURL = "itms-apps://itunes.apple.com/app/id6468183766";
}

String minutesToHoursMinutes(int? duration) {
  if (duration == null || duration == 0) {
    return "hh:mm";
  }
  int hours = 0;
  int minutes = 0;

  hours = duration ~/ 60;
  minutes = duration - (hours * 60);

  return "${hours.toString()}$hr ${minutes.toString()}$activityTime";
}

Future<PackageInfo> appInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo;
}
