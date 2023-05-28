// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      json['name'] as String,
      json['admin'] as String,
      $enumDecode(_$AdminRoleEnumMap, json['role']),
      json['pendingInvitation'] as bool?,
    );

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'name': instance.name,
      'admin': instance.admin,
      'role': _$AdminRoleEnumMap[instance.role]!,
      'pendingInvitation': instance.pendingInvitation,
    };

const _$AdminRoleEnumMap = {
  AdminRole.ADMIN_ROLE_UNSPECIFIED: 'ADMIN_ROLE_UNSPECIFIED',
  AdminRole.PRIMARY_OWNER: 'PRIMARY_OWNER',
  AdminRole.OWNER: 'OWNER',
  AdminRole.MANAGER: 'MANAGER',
  AdminRole.SITE_MANAGER: 'SITE_MANAGER',
};
