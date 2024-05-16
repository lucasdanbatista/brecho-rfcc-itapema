import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'entities/cart.dart';
import 'repositories/cart_repository.dart';

abstract interface class CartManager {
  Cart get currentCart;

  Future<void> initializeNewCart();

  Future<void> loadCurrentCart();

  Future<void> addCartLine(String productVariantId);

  Future<void> updateCartLine(String cartLineId, int quantity);
}

class DefaultCartManager implements CartManager {
  static const _cartKey = 'cart.id';
  final FlutterSecureStorage _secureStorage;
  late Cart _currentCart;
  final CartRepository _repository;

  DefaultCartManager(this._repository, this._secureStorage);

  @override
  Cart get currentCart => _currentCart;

  @override
  Future<void> initializeNewCart() async {
    _currentCart = await _repository.create();
    await _secureStorage.write(key: _cartKey, value: _currentCart.id);
  }

  @override
  Future<void> loadCurrentCart() async {
    final cartId = await _secureStorage.read(key: _cartKey);
    if (cartId == null) {
      await initializeNewCart();
      await loadCurrentCart();
    } else {
      try {
        _currentCart = await _repository.getCartById(cartId);
      } on Exception {
        return initializeNewCart();
      }
    }
  }

  @override
  Future<void> addCartLine(String productVariantId) async {
    _currentCart = await _repository.addCartLine(
      cartId: _currentCart.id,
      productVariantId: productVariantId,
    );
  }

  @override
  Future<void> updateCartLine(String cartLineId, int quantity) async {
    _currentCart = await _repository.updateCartLine(
      cartId: _currentCart.id,
      cartLineId: cartLineId,
      quantity: quantity,
    );
  }
}
