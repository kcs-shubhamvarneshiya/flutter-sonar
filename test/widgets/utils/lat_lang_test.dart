import 'package:akdmvisitorsapp/utils/latlng.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';

void main() {
  group('LatLongExtensions Test', () {
    test('toLatLngString should return a valid string', () {
      final latLng = LatLng(12.345678, -98.765432);
      final latLngString = latLng.toLatLngString();
      expect(latLngString, '12.345678,-98.765432');
    });
  });

  group('StringExtensions Test', () {
    test('toLatLng should return a LatLng from a valid string', () {
      const latLngString = '12.345678,-98.765432';
      final latLng = latLngString.toLatLng();
      expect(latLng, isNotNull);
      expect(latLng!.latitude, 12.345678);
      expect(latLng.longitude, -98.765432);
    });

    test('toLatLng should return null for an invalid string', () {
      const invalidLatLngString = 'invalid_string';
      final latLng = invalidLatLngString.toLatLng();
      expect(latLng, isNull);
    });

  });
}
