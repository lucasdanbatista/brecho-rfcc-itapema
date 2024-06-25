// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartViewModel on CartViewModelBase, Store {
  late final _$cartAtom =
      Atom(name: 'CartViewModelBase.cart', context: context);

  @override
  Cart get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  bool _cartIsInitialized = false;

  @override
  set cart(Cart value) {
    _$cartAtom.reportWrite(value, _cartIsInitialized ? super.cart : null, () {
      super.cart = value;
      _cartIsInitialized = true;
    });
  }

  late final _$addCartLineAsyncAction =
      AsyncAction('CartViewModelBase.addCartLine', context: context);

  @override
  Future<void> addCartLine(String productId, ProductVariant productVariant) {
    return _$addCartLineAsyncAction
        .run(() => super.addCartLine(productId, productVariant));
  }

  late final _$updateCartLineAsyncAction =
      AsyncAction('CartViewModelBase.updateCartLine', context: context);

  @override
  Future<void> updateCartLine(String cartLineId, int quantity) {
    return _$updateCartLineAsyncAction
        .run(() => super.updateCartLine(cartLineId, quantity));
  }

  late final _$CartViewModelBaseActionController =
      ActionController(name: 'CartViewModelBase', context: context);

  @override
  void refreshCart() {
    final _$actionInfo = _$CartViewModelBaseActionController.startAction(
        name: 'CartViewModelBase.refreshCart');
    try {
      return super.refreshCart();
    } finally {
      _$CartViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart}
    ''';
  }
}
