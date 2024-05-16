import '../core/entities/cart_line.dart';
import '../dtos/cart_line_dto.dart';
import 'entity_mapper.dart';
import 'product_variant_mapper.dart';

class CartLineMapper implements EntityMapper<CartLineDTO, CartLine> {
  final ProductVariantMapper _productVariantMapper;

  CartLineMapper(this._productVariantMapper);

  @override
  CartLine toEntity(CartLineDTO it) {
    return CartLine.lazy(
      id: it.id,
      quantity: it.quantity,
      total: it.total,
      productVariant:
          it.productVariant != null ? _productVariantMapper.toEntity(it.productVariant!) : null,
    );
  }
}
