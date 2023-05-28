// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      json['name'] as String,
      json['accountName'] as String,
      json['primaryOwner'] as String?,
      $enumDecode(_$AccountTypeEnumMap, json['type']),
      $enumDecodeNullable(_$AccountRoleEnumMap, json['role']),
      $enumDecode(_$VerificationStateEnumMap, json['verificationState']),
      $enumDecode(_$VettedStateEnumMap, json['vettedState']),
      json['accountNumber'] as String?,
      $enumDecodeNullable(_$PermissionLevelEnumMap, json['permissionLevel']),
      json['organizationInfo'] == null
          ? null
          : OrganizationInfo.fromJson(
              json['organizationInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'name': instance.name,
      'accountName': instance.accountName,
      'primaryOwner': instance.primaryOwner,
      'type': _$AccountTypeEnumMap[instance.type]!,
      'role': _$AccountRoleEnumMap[instance.role],
      'verificationState':
          _$VerificationStateEnumMap[instance.verificationState]!,
      'vettedState': _$VettedStateEnumMap[instance.vettedState]!,
      'accountNumber': instance.accountNumber,
      'permissionLevel': _$PermissionLevelEnumMap[instance.permissionLevel],
      'organizationInfo': instance.organizationInfo,
    };

const _$AccountTypeEnumMap = {
  AccountType.ACCOUNT_TYPE_UNSPECIFIED: 'ACCOUNT_TYPE_UNSPECIFIED',
  AccountType.PERSONAL: 'PERSONAL',
  AccountType.LOCATION_GROUP: 'LOCATION_GROUP',
  AccountType.USER_GROUP: 'USER_GROUP',
  AccountType.ORGANIZATION: 'ORGANIZATION',
};

const _$AccountRoleEnumMap = {
  AccountRole.ACCOUNT_ROLE_UNSPECIFIED: 'ACCOUNT_ROLE_UNSPECIFIED',
  AccountRole.PRIMARY_OWNER: 'PRIMARY_OWNER',
  AccountRole.OWNER: 'OWNER',
  AccountRole.MANAGER: 'MANAGER',
  AccountRole.SITE_MANAGER: 'SITE_MANAGER',
};

const _$VerificationStateEnumMap = {
  VerificationState.VERIFICATION_STATE_UNSPECIFIED:
      'VERIFICATION_STATE_UNSPECIFIED',
  VerificationState.VERIFIED: 'VERIFIED',
  VerificationState.UNVERIFIED: 'UNVERIFIED',
  VerificationState.VERIFICATION_REQUESTED: 'VERIFICATION_REQUESTED',
};

const _$VettedStateEnumMap = {
  VettedState.VETTED_STATE_UNSPECIFIED: 'VETTED_STATE_UNSPECIFIED',
  VettedState.NOT_VETTED: 'NOT_VETTED',
  VettedState.VETTED: 'VETTED',
  VettedState.INVALID: 'INVALID',
};

const _$PermissionLevelEnumMap = {
  PermissionLevel.PERMISSION_LEVEL_UNSPECIFIED: 'PERMISSION_LEVEL_UNSPECIFIED',
  PermissionLevel.OWNER_LEVEL: 'OWNER_LEVEL',
  PermissionLevel.MEMBER_LEVEL: 'MEMBER_LEVEL',
};
