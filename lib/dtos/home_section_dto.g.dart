// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_section_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSectionDTO _$HomeSectionDTOFromJson(Map<String, dynamic> json) =>
    HomeSectionDTO(
      title: json['title'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      productIds: (json['productIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$HomeSectionDTOToJson(HomeSectionDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'productIds': instance.productIds,
      'products': instance.products,
    };
