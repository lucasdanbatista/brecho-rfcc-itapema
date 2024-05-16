import 'package:json_annotation/json_annotation.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDTO {
  String? id;
  String? recipientFirstName;
  String? recipientLastName;
  String? addressLine1;
  String? addressLine2;
  String? zipcode;
  String? city;
  String? state;

  AddressDTO({
    this.id,
    this.recipientFirstName,
    this.recipientLastName,
    this.addressLine1,
    this.addressLine2,
    this.zipcode,
    this.city,
    this.state,
  });

  factory AddressDTO.fromJson(Map<String, dynamic> json) =>
      _$AddressDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDTOToJson(this);
}
