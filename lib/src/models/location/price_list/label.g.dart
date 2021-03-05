// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Label _$LabelFromJson(Map<String, dynamic> json) {
  return Label(
    json['displayName'] as String?,
    json['description'] as String?,
    json['languageCode'] as String?,
  );
}

Map<String, dynamic> _$LabelToJson(Label instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'description': instance.description,
      'languageCode': instance.languageCode,
    };
