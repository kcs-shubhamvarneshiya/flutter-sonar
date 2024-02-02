import 'package:akdmvisitorsapp/presentaion/indoorMap/utils/geo_poly.dart';
import 'package:akdmvisitorsapp/service/dijkstra.dart';
import 'package:flutter/foundation.dart';
import 'package:geojson/geojson.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:akdmvisitorsapp/utils/latlng.dart';
import 'package:logger/logger.dart';

import '../../../service/remote_config.dart';

class Venue {
  List<LatLng> boundPoints;
  List<LatLng> entryPoints;
  List<LatLng> exitPoints;

  Venue({
    required this.boundPoints,
    required this.entryPoints,
    required this.exitPoints,
  });
}
// class Node {
//   int id;
//   LatLng latLng;
//
//   Node(this.id, this.latLng);
//
//   @override
//   String toString() {
//     return 'Node{id: $id, latLng: $latLng}';
//   }
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is Node &&
//           runtimeType == other.runtimeType &&
//           latLng == other.latLng;
//
//   @override
//   int get hashCode => latLng.hashCode;
// }

@singleton
class MapRoutingProvider extends ChangeNotifier {
  Map<String, Map<String, double>> nodeMap = {};
  List<GeoJsonFeature> roadLines = [];
  List<Venue> venues = [];
  List<Venue> boundaries = [];
  List<GeoJsonPoint> gates = [];
  final RemoteConfig remoteConfig;
  final Logger _logger;

  MapRoutingProvider(this.remoteConfig, this._logger) {
    final geo = remoteConfig.routeGeoJson;
    _logger.d('parsed features: ${geo.features.length}');
    roadLines = geo.features;
    for (var e in geo.features) {
      var len = e.properties?['LENGTH'] as double;
      var entryPoint = e.properties?["ENTRYPOINT"] as String?;
      //var wgt = e.properties?['weight'] as double;
      //var effectiveLen = (len * wgt * 1000).round();
      var effectiveLen = len * 1000;
      // var id = e.properties?['ID'] as int;
      var linePoints = (e.geometry as GeoJsonLine).geoSerie?.geoPoints;
      var from = linePoints!.first.toLatLng()!.toLatLngString();
      var to = linePoints.last.toLatLng()!.toLatLngString();

      if (entryPoint == null || entryPoint == "FIRST") {
        if (nodeMap.containsKey(from)) {
          nodeMap[from]!.addEntries([MapEntry(to, effectiveLen)]);
        } else {
          nodeMap[from] = {to: effectiveLen};
        }
      }

      if (entryPoint == null || entryPoint == "LAST") {
        if (nodeMap.containsKey(to)) {
          nodeMap[to]!.addEntries([MapEntry(from, effectiveLen)]);
        } else {
          nodeMap[to] = {from: effectiveLen};
        }
      }
    }
    _logger.d('Node map initialized: ${nodeMap.length}');

    final geo2 = remoteConfig.venueGeoJson;

    for (var feat in geo2.features) {
      if (feat.properties!['entries'] == null ||
          feat.properties!['exits'] == null) {
        continue;
      }
      var bound = (feat.geometry as GeoJsonLine).geoSerie!.toLatLng();
      var entryPoints = (feat.properties!['entries'] as List<dynamic>)
          .map((e) => LatLng(e[1], e[0]))
          .toList();
      var exitPoints = (feat.properties!['exits'] as List<dynamic>)
          .map((e) => LatLng(e[1], e[0]))
          .toList();
      if (entryPoints.isEmpty || exitPoints.isEmpty) {
        continue;
      }
      venues.add(Venue(
        boundPoints: bound,
        entryPoints: entryPoints,
        exitPoints: exitPoints,
      ));
    }
    _logger.d('polygon_fences: ${venues.length}');

    final geo3 = remoteConfig.boundaryGeoJson;

    for (var feat in geo3.features) {
      var bound = (feat.geometry as GeoJsonPolygon).geoSeries.first.toLatLng();
      boundaries
          .add(Venue(boundPoints: bound, entryPoints: [], exitPoints: []));
    }
    _logger.d('boundary_fences: ${boundaries.length}');
  }

  String getSnappedPoint(LatLng point) {
    late String snappedNode;
    var min = double.infinity;
    for (var node in nodeMap.entries) {
      var key = node.key.toLatLng()!;
      var distance = Geolocator.distanceBetween(
        point.latitude,
        point.longitude,
        key.latitude,
        key.longitude,
      );
      if (distance < min) {
        min = distance;
        snappedNode = node.key;
      }
    }
    print('snappedNode: $snappedNode');
    return snappedNode;
  }

  LatLng nearestGate(LatLng point) {
    var min = double.infinity;
    late LatLng entryPoint;
    for (var p in gates) {
      var distance = Geolocator.distanceBetween(
        point.latitude,
        point.longitude,
        p.geoPoint.latitude,
        p.geoPoint.longitude,
      );
      if (distance < min) {
        min = distance;
        entryPoint = p.geoPoint.toLatLng()!;
      }
    }
    return entryPoint;
  }

  String? snapSource(LatLng point) {
    bool insideBoundaries = false;

    for (var boundary in boundaries) {
      insideBoundaries =
          GeoJsonPoly.isPointInPolygon(point, boundary.boundPoints);

      if (insideBoundaries) {
        break;
      }
    }

    if (!insideBoundaries) {
      return null;
    }

    Venue? venueSelected;
    for (var venue in venues) {
      var succeeded = GeoJsonPoly.isPointInPolygon(point, venue.boundPoints);
      if (succeeded) {
        venueSelected = venue;
        break;
      }
    }
    if (venueSelected != null) {
      _logger.d('inside Venue source exit: ${venueSelected.exitPoints}');
      return getSnappedPoint(
          nearestPoint(point, venueSelected.exitPoints).toLatLng()!);
    } else {
      return getSnappedPoint(point);
    }
  }

  String snapDestination(LatLng point) {
    Venue? venueSelected;
    for (var venue in venues) {
      var succeeded = GeoJsonPoly.isPointInPolygon(point, venue.boundPoints);
      if (succeeded) {
        venueSelected = venue;
        break;
      }
    }
    if (venueSelected != null) {
      _logger.i('inside Venue: ${venueSelected.boundPoints.length}');
      _logger.i('inside Venue dest entry: ${venueSelected.entryPoints}');
      return getSnappedPoint(
          nearestPoint(point, venueSelected.entryPoints).toLatLng()!);
    } else {
      _logger.i('SNAPPING NODE');
      return getSnappedPoint(point);
    }
  }

  DijkstraResult? getShortestPath(source, destination) {
    var snappedSource = snapSource(source);
    if (snappedSource == null) {
      return null;
    }
    var snappedDestination = snapDestination(destination);
    return dijkstra(nodeMap, snappedSource, snappedDestination);
  }

  static List<LatLng> getPolylineFromFeature(List<String> coordinate) {
    return coordinate.map((e) => e.toLatLng()!).toList();
  }

  static double? getDistanceFromResult(DijkstraResult result) {
    return result.length / (20 * 100);
  }

  static double? getTimeFromLength(double? len) {
    if (len == null) return null;
    return len / 1.31 / 60;
  }

  void clear() {
    nodeMap.clear();
    roadLines.clear();
    // venues.clear();
    gates.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    clear();
    super.dispose();
  }
}

extension PositionExtensions on Position {
  toLatLng() {
    return LatLng(latitude, longitude);
  }
}

String nearestPoint(LatLng point, List<LatLng> options) {
  var min = double.infinity;
  late String entryPoint;
  for (var p in options) {
    var distance = Geolocator.distanceBetween(
      point.latitude,
      point.longitude,
      p.latitude,
      p.longitude,
    );
    if (distance < min) {
      min = distance;
      entryPoint = p.toLatLngString();
    }
  }
  return entryPoint;
}
