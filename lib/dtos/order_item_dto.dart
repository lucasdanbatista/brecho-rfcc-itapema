import 'package:json_annotation/json_annotation.dart';

import 'product_variant_dto.dart';

part 'order_item_dto.g.dart';

@JsonSerializable()
class OrderItemDTO {
  String? title;
  ProductVariantDTO? productVariant;
  int? quantity;
  double? total;

  OrderItemDTO({
    this.title,
    this.productVariant,
    this.quantity,
    this.total,
  });

  factory OrderItemDTO.fromJson(Map<String, dynamic> json) => _$OrderItemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemDTOToJson(this);
}
