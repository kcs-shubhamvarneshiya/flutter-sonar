import 'package:latlong2/latlong.dart';

extension LatLongExtensions on LatLng {
  String toLatLngString() {
    return '${latitude.toStringAsFixed(6)},${longitude.toStringAsFixed(6)}';
  }
}

extension StringExtensions on String {
  LatLng? toLatLng() {
    try {
      var latLngStrSplit = split(',').map(double.parse).toList();
      if (latLngStrSplit.length != 2) return null;

      return LatLng(latLngStrSplit[0], latLngStrSplit[1]);
    } catch (e) {
      return null;
    }
  }
}
