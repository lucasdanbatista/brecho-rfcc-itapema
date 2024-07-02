// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryDTO _$ProductCategoryDTOFromJson(Map<String, dynamic> json) =>
    ProductCategoryDTO(
      id: json['id'] as String?,
      title: json['name'] as String?,
      image: json['image'] == null ? null : Uri.parse(json['image'] as String),
    );

Map<String, dynamic> _$ProductCategoryDTOToJson(ProductCategoryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'image': instance.image?.toString(),
    };
