// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Money _$MoneyFromJson(Map<String, dynamic> json) => Money(
      json['currencyCode'] as String?,
      json['units'] as String?,
      json['nanos'] as int?,
    );

Map<String, dynamic> _$MoneyToJson(Money instance) => <String, dynamic>{
      'currencyCode': instance.currencyCode,
      'units': instance.units,
      'nanos': instance.nanos,
    };
