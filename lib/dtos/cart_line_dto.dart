import 'package:json_annotation/json_annotation.dart';

import 'product_variant_dto.dart';

part 'cart_line_dto.g.dart';

@JsonSerializable()
class CartLineDTO {
  String? id;
  ProductVariantDTO? productVariant;
  int? quantity;
  double? total;

  CartLineDTO({
    this.id,
    this.productVariant,
    this.quantity,
    this.total,
  });

  factory CartLineDTO.fromJson(Map<String, dynamic> json) =>
      _$CartLineDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CartLineDTOToJson(this);
}
