import '../../dtos/cart_line_dto.dart';
import '../../mappers/cart_mapper.dart';
import '../../providers/cart_provider.dart';
import '../entities/cart.dart';

abstract interface class CartRepository {
  Future<Cart> create();

  Future<Cart> getCartById(String id);

  Future<Cart> addCartLine({
    required String cartId,
    required String productVariantId,
  });

  Future<Cart> updateCartLine({
    required String cartId,
    required String cartLineId,
    required int quantity,
  });
}

class DefaultCartRepository implements CartRepository {
  final CartProvider _provider;
  final CartMapper _mapper;

  DefaultCartRepository(this._provider, this._mapper);

  @override
  Future<Cart> create() async {
    final response = await _provider.createCart();
    return _mapper.toEntity(response);
  }

  @override
  Future<Cart> getCartById(String id) async {
    final response = await _provider.getCartById(id);
    return _mapper.toEntity(response);
  }

  @override
  Future<Cart> addCartLine({
    required String cartId,
    required String productVariantId,
  }) async {
    final response = await _provider.addCartLine(
      cartId: cartId,
      productVariantId: productVariantId,
    );
    return _mapper.toEntity(response);
  }

  @override
  Future<Cart> updateCartLine({
    required String cartId,
    required String cartLineId,
    required int quantity,
  }) async {
    final response = await _provider.updateCartLine(
      cartId: cartId,
      cartLine: CartLineDTO(
        id: cartLineId,
        quantity: quantity,
      ),
    );
    return _mapper.toEntity(response);
  }
}
