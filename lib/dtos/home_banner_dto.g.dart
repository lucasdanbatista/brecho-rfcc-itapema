// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerDTO _$HomeBannerDTOFromJson(Map<String, dynamic> json) =>
    HomeBannerDTO(
      title: json['title'] as String?,
      image: json['image'] == null ? null : Uri.parse(json['image'] as String),
      productIds: (json['productIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HomeBannerDTOToJson(HomeBannerDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image?.toString(),
      'productIds': instance.productIds,
    };
