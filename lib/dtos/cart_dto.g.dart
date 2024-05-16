// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDTO _$CartDTOFromJson(Map<String, dynamic> json) => CartDTO(
      id: json['id'] as String?,
      lines: (json['lines'] as List<dynamic>?)
          ?.map((e) => CartLineDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      checkoutUrl: json['checkoutUrl'] == null
          ? null
          : Uri.parse(json['checkoutUrl'] as String),
    );

Map<String, dynamic> _$CartDTOToJson(CartDTO instance) => <String, dynamic>{
      'id': instance.id,
      'lines': instance.lines,
      'subtotal': instance.subtotal,
      'total': instance.total,
      'checkoutUrl': instance.checkoutUrl?.toString(),
    };
