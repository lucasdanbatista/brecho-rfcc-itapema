import 'entity.dart';
import 'shipping_rate.dart';

class Checkout implements Entity {
  late final String id;
  late final double subtotal;
  late final double total;
  final ShippingRate? selectedShippingRate;
  late final List<ShippingRate> availableShippingRates;

  Checkout.lazy({
    String? id,
    double? subtotal,
    double? total,
    this.selectedShippingRate,
    List<ShippingRate>? availableShippingRates,
  }) {
    if (id != null) this.id = id;
    if (subtotal != null) this.subtotal = subtotal;
    if (total != null) this.total = total;
    if (availableShippingRates != null) {
      this.availableShippingRates = availableShippingRates;
    }
  }
}
