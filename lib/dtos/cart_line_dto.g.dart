// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_line_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartLineDTO _$CartLineDTOFromJson(Map<String, dynamic> json) => CartLineDTO(
      id: json['id'] as String?,
      productVariant: json['productVariant'] == null
          ? null
          : ProductVariantDTO.fromJson(
              json['productVariant'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CartLineDTOToJson(CartLineDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productVariant': instance.productVariant,
      'quantity': instance.quantity,
      'total': instance.total,
    };
