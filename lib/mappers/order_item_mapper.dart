import '../core/entities/order_item.dart';
import '../dtos/order_item_dto.dart';
import 'entity_mapper.dart';
import 'product_variant_mapper.dart';

class OrderItemMapper implements EntityMapper<OrderItemDTO, OrderItem> {
  final ProductVariantMapper _productVariantMapper;

  OrderItemMapper(this._productVariantMapper);

  @override
  OrderItem toEntity(OrderItemDTO it) {
    return OrderItem.lazy(
      title: it.title,
      productVariant:
          it.productVariant != null ? _productVariantMapper.toEntity(it.productVariant!) : null,
      quantity: it.quantity,
      total: it.total,
    );
  }
}
