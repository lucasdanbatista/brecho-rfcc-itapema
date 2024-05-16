import 'package:json_annotation/json_annotation.dart';

import 'product_dto.dart';

part 'home_section_dto.g.dart';

@JsonSerializable()
class HomeSectionDTO {
  String? title;
  List<ProductDTO>? products;

  HomeSectionDTO({
    this.title,
    this.products,
  });

  factory HomeSectionDTO.fromJson(Map<String, dynamic> json) =>
      _$HomeSectionDTOFromJson(json);

  Map<String, dynamic> toJson() => _$HomeSectionDTOToJson(this);
}
