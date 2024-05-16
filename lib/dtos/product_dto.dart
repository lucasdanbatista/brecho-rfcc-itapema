import 'package:json_annotation/json_annotation.dart';

import 'product_option_dto.dart';
import 'product_variant_dto.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDTO {
  String? id;
  String? title;
  String? description;
  List<Uri>? images;
  List<ProductVariantDTO>? variants;
  List<ProductOptionDTO>? options;

  ProductDTO({
    this.id,
    this.title,
    this.description,
    this.images,
    this.variants,
    this.options,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);
}
