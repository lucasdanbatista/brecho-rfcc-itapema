import 'address.dart';
import 'entity.dart';
import 'order_item.dart';
import 'order_status.dart';

class Order implements Entity {
  late final String id;
  late final int orderNumber;
  late final List<OrderItem> items;
  late final OrderStatus status;
  late final Address shippingAddress;
  late final double total;

  Order.lazy({
    String? id,
    int? orderNumber,
    List<OrderItem>? items,
    OrderStatus? status,
    Address? shippingAddress,
    double? total,
  }) {
    if (id != null) this.id = id;
    if (orderNumber != null) this.orderNumber = orderNumber;
    if (items != null) this.items = items;
    if (status != null) this.status = status;
    if (shippingAddress != null) this.shippingAddress = shippingAddress;
    if (total != null) this.total = total;
  }
}
