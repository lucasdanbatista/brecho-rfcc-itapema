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

class MockedCartRepository implements CartRepository {
  @override
  Future<Cart> addCartLine({
    required String cartId,
    required String productVariantId,
  }) async {
    return Cart.lazy(
      id: cartId,
      lines: [],
      subtotal: 0,
      total: 0,
    );
  }

  @override
  Future<Cart> create() async {
    return Cart.lazy(
      id: '1',
      lines: [],
      subtotal: 0,
      total: 0,
    );
  }

  @override
  Future<Cart> getCartById(String id) async {
    return Cart.lazy(
      id: id,
      lines: [],
      subtotal: 0,
      total: 0,
    );
  }

  @override
  Future<Cart> updateCartLine({
    required String cartId,
    required String cartLineId,
    required int quantity,
  }) async {
    return Cart.lazy(
      id: cartId,
      lines: [],
      subtotal: 0,
      total: 0,
    );
  }
}
