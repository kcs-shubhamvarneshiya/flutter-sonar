import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? requestorid;
  String? resourceuri;
  String? additionalinfo;
  String? nonce;
  String? uid;
  String? sid;
  String? aid;
  String? cid;
  String? auth;
  String? fn;
  String? ln;
  String? pid;
  String? ct;
  String? role;
  int? nbf;
  int? exp;
  int? iat;
  String? iss;
  String? aud;

  UserModel(
      {this.id,
        this.requestorid,
        this.resourceuri,
        this.additionalinfo,
        this.nonce,
        this.uid,
        this.sid,
        this.aid,
        this.cid,
        this.auth,
        this.fn,
        this.ln,
        this.pid,
        this.ct,
        this.role,
        this.nbf,
        this.exp,
        this.iat,
        this.iss,
        this.aud});


  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}