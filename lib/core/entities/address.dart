import 'entity.dart';

class Address implements Entity {
  late final String id;
  late final String recipientFirstName;
  late final String recipientLastName;
  late final String addressLine1;
  late final String addressLine2;
  late final String zipcode;
  late final String city;
  late final String state;

  Address.lazy({
    String? id,
    String? recipientFirstName,
    String? recipientLastName,
    String? addressLine1,
    String? addressLine2,
    String? zipcode,
    String? city,
    String? state,
  }) {
    if (id != null) this.id = id;
    if (recipientFirstName != null) {
      this.recipientFirstName = recipientFirstName;
    }
    if (recipientLastName != null) this.recipientLastName = recipientLastName;
    if (addressLine1 != null) this.addressLine1 = addressLine1;
    if (addressLine2 != null) this.addressLine2 = addressLine2;
    if (zipcode != null) this.zipcode = zipcode;
    if (city != null) this.city = city;
    if (state != null) this.state = state;
  }

  String get recipientName => '$recipientFirstName $recipientLastName';
}
