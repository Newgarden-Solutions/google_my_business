// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_admins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationAdmins _$LocationAdminsFromJson(Map<String, dynamic> json) {
  return LocationAdmins(
    (json['admins'] as List<dynamic>)
        .map((e) => Admin.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LocationAdminsToJson(LocationAdmins instance) =>
    <String, dynamic>{
      'admins': instance.admins,
    };
