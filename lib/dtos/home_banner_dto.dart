import 'package:json_annotation/json_annotation.dart';

part 'home_banner_dto.g.dart';

@JsonSerializable()
class HomeBannerDTO {
  String? title;
  Uri? image;
  List<String>? productIds;

  HomeBannerDTO({
    this.title,
    this.image,
    this.productIds,
  });

  factory HomeBannerDTO.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerDTOFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerDTOToJson(this);
}
