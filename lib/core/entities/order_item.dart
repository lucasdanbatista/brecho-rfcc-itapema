import 'entity.dart';
import 'product_variant.dart';

class OrderItem implements Entity {
  late final String title;
  late final ProductVariant productVariant;
  late final int quantity;
  late final double total;

  OrderItem.lazy({
    String? title,
    ProductVariant? productVariant,
    int? quantity,
    double? total,
  }) {
    if (title != null) this.title = title;
    if (productVariant != null) this.productVariant = productVariant;
    if (quantity != null) this.quantity = quantity;
    if (total != null) this.total = total;
  }
}
