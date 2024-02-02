// ignore_for_file: unrelated_type_equality_checks
import 'dart:async';
import 'dart:convert';

import 'package:akdmvisitorsapp/model/attraction/attraction.dart';
import 'package:akdmvisitorsapp/repository/app_json_repository.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:injectable/injectable.dart';

import 'model/app_json/app_json.dart';
import 'notification/notification_configuration.dart';

@singleton
class InitBeacon {
  AppJsonRepository appJsonRepository;
  bool? value =false;
  StreamSubscription<RangingResult>? streamRanging;
  final regionBeacons = <Region, List<Beacon>>{};
  var beacons = <Beacon>[];
  bool? isSameBeacon =false;
  Beacon? nearBeacon;
  Beacon? tempBeacon;
  Map<String, dynamic> beaconAccurList=  <String, dynamic>{} ;
  List<Map<String, dynamic>> listvalue =[];
  var accuracy;

  InitBeacon(this.appJsonRepository);

  initScanBeacon(String beaconId) async{
    print("init beacon calling...");
    await flutterBeacon.initializeScanning;

    final regions = <Region>[
      Region(identifier: 'CiscoMeraki',
        proximityUUID: beaconId,
      ),
    ];

    if(streamRanging != null) {
      if (streamRanging!.isPaused) {
        streamRanging?.resume();
        return;
      }
    }

    int compareParameters(Beacon a, Beacon b){
      int compare = a.proximityUUID.compareTo(b.proximityUUID);
      if (compare == 0) {
        compare = a.major.compareTo(b.major);
      }
      if (compare == 0) {
        compare = a.minor.compareTo(b.minor);
      }
      return compare;
    }

     streamRanging = flutterBeacon.ranging(regions).listen((RangingResult result) {
      print("Beconsss Result:${result}");
      regionBeacons[result.region] = result.beacons;
      beacons.clear();
      regionBeacons.values.forEach((list) async {
      beacons.addAll(list);
        // ignore: iterable_contains_unrelated_type
      if(beacons.isNotEmpty && beacons.length > 0){
        if(accuracy!=null){
          for(var i = 0 ; i< beacons.length; i++) {
            print("accccc${accuracy.accuracy}");
            if (beacons[i].accuracy.toString() == accuracy.accuracy.toString() && beacons[i].proximity  == Proximity.near){
              nearBeacon = beacons[i];
              /*Fluttertoast.showToast(
                msg: "near becon$nearBeacon",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                fontSize: 16.0
            );*/
              AppJsonModel jsonDataRepo = await appJsonRepository.loadJsonAssetData();
              Attraction? attraction = Attraction();
              var attractionData = jsonDataRepo.attractions;
              for (var j1 = 0; j1 < attractionData!.length; j1++) {
                if (attractionData[j1].beacon!.major == nearBeacon!.major &&
                    attractionData[j1].beacon!.minor == nearBeacon!.minor) {
                  attraction = attractionData[j1];
                }
              }
              if (isSameBeacon == false) {
                NotificationConfigurations().setupLocalNotification("You are near ${attraction!.title.toString()}",json.encode(attraction).toString());
                isSameBeacon = true;
                tempBeacon = nearBeacon;
                print("tempbecon ${tempBeacon.toString()}");
              } else {
                if (nearBeacon!.minor.toInt() == tempBeacon!.minor.toInt() && nearBeacon!.major.toInt() == tempBeacon!.major.toInt()) {
                  /*Fluttertoast.showToast(
                    msg: "equalllll",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 16.0
                );*/
                } else {
                  NotificationConfigurations().setupLocalNotification("You are near ${attraction!.title.toString()}", json.encode(attraction).toString());
                  tempBeacon = nearBeacon;
                  /*Fluttertoast.showToast(
                    msg: "updated$tempBeacon",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 16.0
                );*/
                }
              }
            }
          }
        }

          /*beaconAccurList['proximityUUID'] =  beacons[i].proximityUUID.toString();
          beaconAccurList['major'] =  beacons[i].major.toString();
          beaconAccurList['minor'] =  beacons[i].minor.toString();
          beaconAccurList['rssi'] =  beacons[i].rssi.toString();
          beaconAccurList['accuracy'] =  beacons[i].accuracy.toDouble();
          beaconAccurList['proximity'] =  beacons[i].proximity.toString();
          beaconAccurList['txPower'] =  beacons[i].txPower.toString();
          beaconAccurList['macAddress'] =  beacons[i].macAddress.toString();
          listvalue.add(beaconAccurList);*/
        accuracy= beacons.reduce((a, b) => a.accuracy < b.accuracy ? a : b);
      }
        tempBeacon=nearBeacon;

       /*print("list of map: ${listvalue.length}");
        print("Lowest beacon: ${listvalue.map<double>((e) => e['accuracy']).reduce(math.min)}");*/

      });
      beacons.sort(compareParameters);

    });
  }

  @override
  Future<void> close() async {
    streamRanging?.cancel();
  }

}