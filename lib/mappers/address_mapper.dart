import '../core/entities/address.dart';
import '../dtos/address_dto.dart';
import 'entity_mapper.dart';

class AddressMapper implements EntityMapper<AddressDTO, Address> {
  @override
  Address toEntity(AddressDTO it) {
    return Address.lazy(
      id: it.id,
      recipientFirstName: it.recipientFirstName,
      recipientLastName: it.recipientLastName,
      addressLine1: it.addressLine1,
      addressLine2: it.addressLine2,
      zipcode: it.zipcode,
      city: it.city,
      state: it.state,
    );
  }
}
