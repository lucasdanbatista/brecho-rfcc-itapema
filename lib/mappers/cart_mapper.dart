import '../core/entities/cart.dart';
import '../dtos/cart_dto.dart';
import 'cart_line_mapper.dart';
import 'entity_mapper.dart';

class CartMapper implements EntityMapper<CartDTO, Cart> {
  final CartLineMapper _lineMapper;

  CartMapper(this._lineMapper);

  @override
  Cart toEntity(CartDTO it) {
    return Cart.lazy(
      id: it.id,
      lines: it.lines?.map(_lineMapper.toEntity).toList(),
      subtotal: it.subtotal,
      total: it.total,
    );
  }
}
