// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) {
  return Admin(
    json['name'] as String,
    json['admin'] as String,
    _$enumDecode(_$AdminRoleEnumMap, json['role']),
    json['pendingInvitation'] as bool,
  );
}

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'name': instance.name,
      'admin': instance.admin,
      'role': _$AdminRoleEnumMap[instance.role],
      'pendingInvitation': instance.pendingInvitation,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$AdminRoleEnumMap = {
  AdminRole.ADMIN_ROLE_UNSPECIFIED: 'ADMIN_ROLE_UNSPECIFIED',
  AdminRole.PRIMARY_OWNER: 'PRIMARY_OWNER',
  AdminRole.OWNER: 'OWNER',
  AdminRole.MANAGER: 'MANAGER',
  AdminRole.SITE_MANAGER: 'SITE_MANAGER',
};
