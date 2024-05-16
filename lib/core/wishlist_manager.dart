import 'package:collection/collection.dart';

import 'entities/product.dart';
import 'repositories/wishlist_repository.dart';

abstract interface class WishlistManager {
  List<Product> get wishlist;

  bool isFavorite(Product product);

  Future<void> fetch();

  Future<void> addToWishlist(String productId);

  Future<void> removeFromWishlist(String productId);
}

class DefaultWishlistManager implements WishlistManager {
  final WishlistRepository _repository;

  DefaultWishlistManager(this._repository);

  @override
  List<Product> wishlist = [];

  @override
  bool isFavorite(Product product) => wishlist.firstWhereOrNull((e) => e.id == product.id) != null;

  @override
  Future<void> addToWishlist(String productId) => _repository.addToWishlist(productId);

  @override
  Future<void> fetch() async => wishlist = await _repository.fetch();

  @override
  Future<void> removeFromWishlist(String productId) => _repository.removeFromWishlist(productId);
}
