import 'entities/cart.dart';
import 'entities/cart_line.dart';
import 'entities/product_variant.dart';
import 'repositories/product_repository.dart';

abstract interface class CartManager {
  Cart get currentCart;

  Future<void> initializeNewCart();

  Future<void> addCartLine(String productId, ProductVariant productVariant);

  Future<void> updateCartLine(String cartLineId, int quantity);
}

class InMemoryCartManager implements CartManager {
  final ProductRepository _productRepository;

  late Cart _currentCart;

  InMemoryCartManager(this._productRepository);

  @override
  Cart get currentCart => _currentCart;

  @override
  Future<void> initializeNewCart() async {
    _currentCart = Cart.lazy(
      id: '1',
      lines: [],
      subtotal: 0,
      total: 0,
    );
  }

  @override
  Future<void> addCartLine(
    String productId,
    ProductVariant productVariant,
  ) async {
    final product = await _productRepository.findById(productId);
    _currentCart.lines.add(
      CartLine.lazy(
        id: productVariant.id,
        productVariant: product.variants.firstWhere(
          (e) => e.id == productVariant.id,
        ),
        quantity: 1,
        total: productVariant.sellingPrice,
      ),
    );
    _updateCart();
  }

  @override
  Future<void> updateCartLine(String cartLineId, int quantity) async {
    final cartLine = _currentCart.lines.firstWhere((e) => e.id == cartLineId);
    if (quantity == 0) {
      _currentCart.lines.remove(cartLine);
    } else {
      cartLine.quantity = quantity;
    }
    _updateCart();
  }

  void _updateCart() {
    var subtotal = 0.0;
    for (final line in _currentCart.lines) {
      subtotal += line.total * line.quantity;
    }
    _currentCart.subtotal = subtotal;
    _currentCart.total = subtotal;
  }
}
