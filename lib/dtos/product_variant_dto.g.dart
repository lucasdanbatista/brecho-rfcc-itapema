// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVariantDTO _$ProductVariantDTOFromJson(Map<String, dynamic> json) =>
    ProductVariantDTO(
      id: json['id'] as String?,
      productId: json['productId'] as String?,
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      sellingPrice: (json['sellingPrice'] as num?)?.toDouble(),
      title: json['title'] as String?,
      image: json['image'] == null ? null : Uri.parse(json['image'] as String),
    );

Map<String, dynamic> _$ProductVariantDTOToJson(ProductVariantDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'originalPrice': instance.originalPrice,
      'sellingPrice': instance.sellingPrice,
      'title': instance.title,
      'image': instance.image?.toString(),
    };
