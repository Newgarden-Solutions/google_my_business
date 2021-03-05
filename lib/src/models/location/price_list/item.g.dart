// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    json['itemId'] as String?,
    (json['labels'] as List<dynamic>?)
        ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['price'] == null
        ? null
        : Money.fromJson(json['price'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'labels': instance.labels,
      'price': instance.price,
    };
