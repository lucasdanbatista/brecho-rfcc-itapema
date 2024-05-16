import '../core/entities/order.dart';
import '../dtos/order_dto.dart';
import 'address_mapper.dart';
import 'entity_mapper.dart';
import 'order_item_mapper.dart';

class OrderMapper implements EntityMapper<OrderDTO, Order> {
  final OrderItemMapper _itemMapper;
  final AddressMapper _addressMapper;

  OrderMapper(this._itemMapper, this._addressMapper);

  @override
  Order toEntity(OrderDTO it) {
    return Order.lazy(
      id: it.id,
      orderNumber: it.orderNumber,
      items: it.items?.map(_itemMapper.toEntity).toList(),
      status: it.status,
      shippingAddress:
          it.shippingAddress != null ? _addressMapper.toEntity(it.shippingAddress!) : null,
      total: it.total,
    );
  }
}
