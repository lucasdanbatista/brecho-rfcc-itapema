import '../../core/entities/address.dart';
import 'formatter.dart';

class AddressFormatter implements Formatter<Address, String> {
  @override
  String format(Address it) =>
      '${it.addressLine1}, ${it.addressLine2}. ${it.city}, ${it.state} - ${it.zipcode}.';
}
