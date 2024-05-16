import 'package:json_annotation/json_annotation.dart';

part 'product_variant_dto.g.dart';

@JsonSerializable()
class ProductVariantDTO {
  String? id;
  String? productId;
  double? originalPrice;
  double? sellingPrice;
  String? title;
  Uri? image;

  ProductVariantDTO({
    this.id,
    this.productId,
    this.originalPrice,
    this.sellingPrice,
    this.title,
    this.image,
  });

  factory ProductVariantDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVariantDTOToJson(this);
}
