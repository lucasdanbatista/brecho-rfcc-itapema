// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDTO _$AddressDTOFromJson(Map<String, dynamic> json) => AddressDTO(
      id: json['id'] as String?,
      recipientFirstName: json['recipientFirstName'] as String?,
      recipientLastName: json['recipientLastName'] as String?,
      addressLine1: json['addressLine1'] as String?,
      addressLine2: json['addressLine2'] as String?,
      zipcode: json['zipcode'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$AddressDTOToJson(AddressDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipientFirstName': instance.recipientFirstName,
      'recipientLastName': instance.recipientLastName,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'zipcode': instance.zipcode,
      'city': instance.city,
      'state': instance.state,
    };
