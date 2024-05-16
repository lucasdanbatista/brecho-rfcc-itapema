import 'entity.dart';
import 'product_variant.dart';

class CartLine implements Entity {
  late final String id;
  late final ProductVariant productVariant;
  late final int quantity;
  late final double total;

  CartLine.lazy({
    String? id,
    ProductVariant? productVariant,
    int? quantity,
    double? total,
  }) {
    if (id != null) this.id = id;
    if (productVariant != null) this.productVariant = productVariant;
    if (quantity != null) this.quantity = quantity;
    if (total != null) this.total = total;
  }
}
