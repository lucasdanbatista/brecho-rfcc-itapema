import 'package:json_annotation/json_annotation.dart';

import '../core/entities/order_status.dart';
import 'address_dto.dart';
import 'order_item_dto.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDTO {
  String? id;
  int? orderNumber;
  List<OrderItemDTO>? items;
  OrderStatus? status;
  AddressDTO? shippingAddress;
  double? total;

  OrderDTO({
    this.id,
    this.orderNumber,
    this.items,
    this.status,
    this.shippingAddress,
    this.total,
  });

  factory OrderDTO.fromJson(Map<String, dynamic> json) => _$OrderDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDTOToJson(this);
}
