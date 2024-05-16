import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';

import '../../core/entities/product.dart';
import '../../core/wishlist_manager.dart';

part 'wishlist_view_model.g.dart';

class WishlistViewModel = WishlistViewModelBase with _$WishlistViewModel;

abstract class WishlistViewModelBase with Store {
  final WishlistManager _manager;

  WishlistViewModelBase(this._manager);

  @observable
  late ObservableList<Product> wishlist = ObservableList.of(_manager.wishlist);

  bool isFavorite(Product product) => wishlist.firstWhereOrNull((e) => e.id == product.id) != null;

  @action
  Future<void> fetch() async {
    await _manager.fetch();
    wishlist = ObservableList.of(_manager.wishlist);
  }

  Future<void> toggleFavorite(Product product) async {
    if (_manager.isFavorite(product)) {
      await _removeFromWishlist(product.id);
    } else {
      await _addToWishlist(product.id);
    }
  }

  Future<void> _addToWishlist(String productId) async {
    await _manager.addToWishlist(productId);
    await fetch();
  }

  Future<void> _removeFromWishlist(String productId) async {
    await _manager.removeFromWishlist(productId);
    await fetch();
  }
}
