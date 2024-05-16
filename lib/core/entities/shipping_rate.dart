import 'entity.dart';

class ShippingRate implements Entity {
  late final String id;
  late final String title;
  late final double price;

  ShippingRate.lazy({
    String? id,
    String? title,
    double? price,
  }) {
    if (id != null) this.id = id;
    if (title != null) this.title = title;
    if (price != null) this.price = price;
  }
}
