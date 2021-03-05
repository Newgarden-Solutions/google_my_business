// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceList _$PriceListFromJson(Map<String, dynamic> json) {
  return PriceList(
    json['priceListId'] as String?,
    (json['labels'] as List<dynamic>?)
        ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['sourceUrl'] as String?,
    (json['sections'] as List<dynamic>?)
        ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PriceListToJson(PriceList instance) => <String, dynamic>{
      'priceListId': instance.priceListId,
      'labels': instance.labels,
      'sourceUrl': instance.sourceUrl,
      'sections': instance.sections,
    };
