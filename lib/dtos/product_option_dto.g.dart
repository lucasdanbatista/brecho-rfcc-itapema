// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOptionDTO _$ProductOptionDTOFromJson(Map<String, dynamic> json) =>
    ProductOptionDTO(
      id: json['id'] as String?,
      name: json['name'] as String?,
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductOptionDTOToJson(ProductOptionDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'values': instance.values,
    };
