import 'package:sqflite/sqflite.dart';

import '../dtos/product_dto.dart';
import '../dtos/product_variant_dto.dart';
import 'product_provider.dart';

abstract interface class WishlistProvider {
  Future<List<ProductDTO>> fetch();

  Future<void> addToWishlist(String productId);

  Future<void> removeFromWishlist(String productId);
}

class LocalWishlistProvider implements WishlistProvider {
  final ProductProvider _productProvider;
  final Database _database;

  LocalWishlistProvider(this._database, this._productProvider);

  @override
  Future<List<ProductDTO>> fetch() async {
    final result = await _database.query('Wishlist');
    final ids = result.map(ProductVariantDTO.fromJson).toList().map((e) => e.id!).toList();
    return _productProvider.findAllByIds(ids.join(','));
  }

  @override
  Future<void> addToWishlist(String productId) => _database.insert('Wishlist', {'id': productId});

  @override
  Future<void> removeFromWishlist(String productId) =>
      _database.delete('Wishlist', where: 'id = ?', whereArgs: [productId]);
}
