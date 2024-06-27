// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_reservation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderReservationDTO _$OrderReservationDTOFromJson(Map<String, dynamic> json) =>
    OrderReservationDTO(
      customerName: json['customerName'] as String,
      customerPhone: json['customerPhone'] as String,
      productVariantIds: (json['productVariantIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderReservationDTOToJson(
        OrderReservationDTO instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'total': instance.total,
      'productVariantIds': instance.productVariantIds,
    };
