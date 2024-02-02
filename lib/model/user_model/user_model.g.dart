// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      requestorid: json['requestorid'] as String?,
      resourceuri: json['resourceuri'] as String?,
      additionalinfo: json['additionalinfo'] as String?,
      nonce: json['nonce'] as String?,
      uid: json['uid'] as String?,
      sid: json['sid'] as String?,
      aid: json['aid'] as String?,
      cid: json['cid'] as String?,
      auth: json['auth'] as String?,
      fn: json['fn'] as String?,
      ln: json['ln'] as String?,
      pid: json['pid'] as String?,
      ct: json['ct'] as String?,
      role: json['role'] as String?,
      nbf: json['nbf'] as int?,
      exp: json['exp'] as int?,
      iat: json['iat'] as int?,
      iss: json['iss'] as String?,
      aud: json['aud'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'requestorid': instance.requestorid,
      'resourceuri': instance.resourceuri,
      'additionalinfo': instance.additionalinfo,
      'nonce': instance.nonce,
      'uid': instance.uid,
      'sid': instance.sid,
      'aid': instance.aid,
      'cid': instance.cid,
      'auth': instance.auth,
      'fn': instance.fn,
      'ln': instance.ln,
      'pid': instance.pid,
      'ct': instance.ct,
      'role': instance.role,
      'nbf': instance.nbf,
      'exp': instance.exp,
      'iat': instance.iat,
      'iss': instance.iss,
      'aud': instance.aud,
    };
