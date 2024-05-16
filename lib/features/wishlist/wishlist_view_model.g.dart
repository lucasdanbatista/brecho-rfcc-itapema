// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WishlistViewModel on WishlistViewModelBase, Store {
  late final _$wishlistAtom =
      Atom(name: 'WishlistViewModelBase.wishlist', context: context);

  @override
  ObservableList<Product> get wishlist {
    _$wishlistAtom.reportRead();
    return super.wishlist;
  }

  bool _wishlistIsInitialized = false;

  @override
  set wishlist(ObservableList<Product> value) {
    _$wishlistAtom
        .reportWrite(value, _wishlistIsInitialized ? super.wishlist : null, () {
      super.wishlist = value;
      _wishlistIsInitialized = true;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('WishlistViewModelBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
wishlist: ${wishlist}
    ''';
  }
}
