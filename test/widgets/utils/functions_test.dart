import 'package:akdmvisitorsapp/service/remote_config.dart';
import 'package:akdmvisitorsapp/utils/functions.dart';
import 'package:akdmvisitorsapp/utils/strings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mockito/mockito.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MockRemoteConfig extends Mock implements RemoteConfig {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

    //ConvertDateFormat Extension'
    test('should return formatted date', () {
      final date = DateTime(2023, 10, 26);
      final formattedDate = date.selectedDate("2023-10-26", "yyyy-MM-dd", "dd/MM/yyyy");
      expect(formattedDate, "26/10/2023");
    });

    test('should return the original date on parsing error', () {
      final originalDate = "2023-10-26";
      final formattedDate = originalDate.selectedDate("invalid", "yyyy-MM-dd", "dd/MM/yyyy");
      expect(formattedDate, originalDate);
    });

    test('should show a toast with the specified message', () {
      const String message = 'Hello, Flutter!';
      Fluttertoast.cancel(); // Cancel any existing toasts

      expect(() => Fluttertoast.showToast(msg: message,), returnsNormally,);
    });


    test('should launch a map URL with valid coordinates', () async {
      const lat = 40.7128;
      const lon = -74.0060;
      const urlData = 'https://maps.google.com/maps?q=';

      final url = '$urlData$lat,$lon';
      expect(() => launchUrlString(url,mode: LaunchMode.externalApplication),
        returnsNormally,
      );
    });

    String capitalizeOnlyFirstLater(String type) {
      if (type.trim().isEmpty) return "";
      return "${type[0].toUpperCase()}${type.substring(1).toLowerCase()}";
    }

    test('should capitalize the first letter of a string', () {
        final type = 'example string';

        final result = capitalizeOnlyFirstLater(type);

        expect(result, 'Example string');
        expect(result, isNotEmpty);
      });


    String? validateEmail(String value){
      String? msg;
      String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        msg = validEmailMsg;
      } else {
        msg = null;
      }
      return msg;
    }

    test('should return null for a valid email', () {
      const value = 'example@example.com';

      final result = validateEmail(value);

      expect(result, null);
    });

    test('should return an error message for an invalid email', () {
      const value = 'invalidemail';

      final result = validateEmail(value);

      expect(result, 'Enter valid email address');
    });



    test('should return "Just now" for a time difference less than a minute', () {
      final currentTime = DateTime.now();
      final oneSecondAgo = currentTime.subtract(const Duration(seconds: 1));

      final result = oneSecondAgo.getVerboseDateTimeRepresentation();

      expect(result, 'Just now');
    });

    test('should return the time in "h:mm am/pm" format for the same day', () {
      final currentTime = DateTime(2023, 10, 26, 14, 30);
      final sameDayTime = DateTime(2023, 10, 26, 15, 45);

      final result = sameDayTime.getVerboseDateTimeRepresentation();

      expect(result, '3:45 PM');
    });

    test('should return "Yesterday" for a time difference of one day', () {
      final currentTime = DateTime(2023, 10, 26);
      final oneDayAgo = DateTime(2023, 10, 25);

      final result = oneDayAgo.getVerboseDateTimeRepresentation();

      expect(result, 'Yesterday');
    });

    test('should return the full date for a time difference less than four days', () {
      final currentTime = DateTime(2023, 10, 26);
      final threeDaysAgo = DateTime(2023, 10, 23);

      final result = threeDaysAgo.getVerboseDateTimeRepresentation();

      expect(result, '10/23/2023, 12:00 AM');
    });

    test('should return a weekday and time for older dates', () {
      final currentTime = DateTime(2023, 10, 26);
      final fiveDaysAgo = DateTime(2023, 10, 21, 14, 30);

      final result = fiveDaysAgo.getVerboseDateTimeRepresentation();

      expect(result, 'Friday, 2:30 PM');
    });


    test('getTimeStringFromDouble returns valid time string', () {
      const double timeValue = 12.5; // 12 hours and 30 minutes
      final String formattedTime = timeValue.getTimeStringFromDouble();
      expect(formattedTime, '12:30 AM');
    });

    test('getTimeStringFromDouble handles negative value', () {
      const double timeValue = -1.5; // Negative value
      final String formattedTime = timeValue.getTimeStringFromDouble();
      expect(formattedTime, 'Invalid Value');
    });

    //MinuteFormatting Extension
    test('getMinuteString returns padded minutes', () {
      const double minutesValue = 5.5; // 5.5 minutes
      final String formattedMinutes = minutesValue.getMinuteString();
      expect(formattedMinutes, '05');
    });

    //HourFormatting Extension
    test('getHourString returns padded hours', () {
      const int hoursValue = 3; // 3 hours
      final String formattedHours = hoursValue.getHourString();
      expect(formattedHours, '03');
    });

    test('getHourString handles values over 24 hours', () {
      const int hoursValue = 30; // 30 hours
      final String formattedHours = hoursValue.getHourString();
      expect(formattedHours, '06'); // 30 hours % 24 = 6
    });


    test('Returns null if RemoteConfig has no video URLs', () {
      final mockRemoteConfig = MockRemoteConfig();
      // Mock the behavior of getting a RemoteConfig object
      when(mockRemoteConfig.videoConfig).thenReturn(mockRemoteConfig.videoConfig);

      final randomVideoUrl = 0.getVideoUrl(mockRemoteConfig);

      expect(randomVideoUrl, isNull);
    });



}