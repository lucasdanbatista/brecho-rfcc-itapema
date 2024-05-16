import 'package:json_annotation/json_annotation.dart';

part 'product_option_dto.g.dart';

@JsonSerializable()
class ProductOptionDTO {
  String? id;
  String? name;
  List<String>? values;

  ProductOptionDTO({
    this.id,
    this.name,
    this.values,
  });

  factory ProductOptionDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOptionDTOToJson(this);
}
