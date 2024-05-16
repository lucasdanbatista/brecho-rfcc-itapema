import '../../mappers/product_mapper.dart';
import '../../providers/wishlist_provider.dart';
import '../entities/product.dart';

abstract interface class WishlistRepository {
  Future<List<Product>> fetch();

  Future<void> addToWishlist(String productId);

  Future<void> removeFromWishlist(String productId);
}

class DefaultWishlistRepository implements WishlistRepository {
  final WishlistProvider _provider;
  final ProductMapper _productMapper;

  DefaultWishlistRepository(this._provider, this._productMapper);

  @override
  Future<List<Product>> fetch() async {
    final result = await _provider.fetch();
    return result.map(_productMapper.toEntity).toList();
  }

  @override
  Future<void> addToWishlist(String productId) => _provider.addToWishlist(productId);

  @override
  Future<void> removeFromWishlist(String productId) => _provider.removeFromWishlist(productId);
}
