// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_admins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountAdmins _$AccountAdminsFromJson(Map<String, dynamic> json) {
  return AccountAdmins(
    (json['accountAdmins'] as List<dynamic>)
        .map((e) => Admin.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AccountAdminsToJson(AccountAdmins instance) =>
    <String, dynamic>{
      'accountAdmins': instance.accountAdmins,
    };
