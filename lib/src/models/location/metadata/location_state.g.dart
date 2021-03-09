// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationState _$LocationStateFromJson(Map<String, dynamic> json) {
  return LocationState(
    json['isGoogleUpdated'] as bool?,
    json['isDuplicate'] as bool?,
    json['isSuspended'] as bool?,
    json['canUpdate'] as bool?,
    json['canDelete'] as bool?,
    json['isVerified'] as bool?,
    json['needsReverification'] as bool?,
    json['isPendingReview'] as bool?,
    json['isDisabled'] as bool?,
    json['isPublished'] as bool?,
    json['isDisconnected'] as bool?,
    json['isLocalPostApiDisabled'] as bool?,
    json['canModifyServiceList'] as bool?,
    json['canHaveFoodMenus'] as bool?,
    json['hasPendingEdits'] as bool?,
    json['hasPendingVerification'] as bool?,
    json['canOperateHealthData'] as bool?,
    json['canOperateLodgingData'] as bool?,
  );
}

Map<String, dynamic> _$LocationStateToJson(LocationState instance) =>
    <String, dynamic>{
      'isGoogleUpdated': instance.isGoogleUpdated,
      'isDuplicate': instance.isDuplicate,
      'isSuspended': instance.isSuspended,
      'canUpdate': instance.canUpdate,
      'canDelete': instance.canDelete,
      'isVerified': instance.isVerified,
      'needsReverification': instance.needsReverification,
      'isPendingReview': instance.isPendingReview,
      'isDisabled': instance.isDisabled,
      'isPublished': instance.isPublished,
      'isDisconnected': instance.isDisconnected,
      'isLocalPostApiDisabled': instance.isLocalPostApiDisabled,
      'canModifyServiceList': instance.canModifyServiceList,
      'canHaveFoodMenus': instance.canHaveFoodMenus,
      'hasPendingEdits': instance.hasPendingEdits,
      'hasPendingVerification': instance.hasPendingVerification,
      'canOperateHealthData': instance.canOperateHealthData,
      'canOperateLodgingData': instance.canOperateLodgingData,
    };
