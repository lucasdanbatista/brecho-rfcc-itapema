import 'package:mobx/mobx.dart';

import '../../core/cart_manager.dart';
import '../../core/entities/cart.dart';
import '../../core/entities/product_variant.dart';

part 'cart_view_model.g.dart';

class CartViewModel = CartViewModelBase with _$CartViewModel;

abstract class CartViewModelBase with Store {
  final CartManager _cartManager;

  CartViewModelBase(this._cartManager);

  @observable
  late Cart cart = _cartManager.currentCart;

  @action
  void refreshCart() {
    cart = Cart.lazy(
      id: _cartManager.currentCart.id,
      lines: _cartManager.currentCart.lines,
      subtotal: _cartManager.currentCart.subtotal,
      total: _cartManager.currentCart.total,
      checkoutUrl: _cartManager.currentCart.checkoutUrl,
    );
  }

  @action
  Future<void> addCartLine(String productId, ProductVariant productVariant) async {
    await _cartManager.addCartLine(productId, productVariant);
    refreshCart();
  }

  @action
  Future<void> updateCartLine(String cartLineId, int quantity) async {
    await _cartManager.updateCartLine(cartLineId, quantity);
    refreshCart();
  }
}
