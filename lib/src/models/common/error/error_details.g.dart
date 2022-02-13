// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDetails _$ErrorDetailsFromJson(Map<String, dynamic> json) => ErrorDetails(
      (json['fieldViolations'] as List<dynamic>?)
          ?.map((e) => FieldViolation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorDetailsToJson(ErrorDetails instance) =>
    <String, dynamic>{
      'fieldViolations': instance.fieldViolations,
    };
