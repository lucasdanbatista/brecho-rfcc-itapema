import 'package:json_annotation/json_annotation.dart';

part 'order_reservation_dto.g.dart';

@JsonSerializable()
class OrderReservationDTO {
  final String customerName;
  final String customerPhone;
  final double total;
  final List<String> productVariantIds;

  OrderReservationDTO({
    required this.customerName,
    required this.customerPhone,
    required this.productVariantIds,
    required this.total,
  });

  factory OrderReservationDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderReservationDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OrderReservationDTOToJson(this);
}
