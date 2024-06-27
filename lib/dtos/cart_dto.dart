import 'package:json_annotation/json_annotation.dart';

import 'cart_line_dto.dart';

part 'cart_dto.g.dart';

@JsonSerializable()
class CartDTO {
  String? id;
  List<CartLineDTO>? lines;
  double? subtotal;
  double? total;

  CartDTO({
    this.id,
    this.lines,
    this.subtotal,
    this.total,
  });

  factory CartDTO.fromJson(Map<String, dynamic> json) =>
      _$CartDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CartDTOToJson(this);
}
