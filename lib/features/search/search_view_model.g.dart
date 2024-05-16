// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchViewModel on SearchViewModelBase, Store {
  late final _$productsAtom =
      Atom(name: 'SearchViewModelBase.products', context: context);

  @override
  List<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$searchAsyncAction =
      AsyncAction('SearchViewModelBase.search', context: context);

  @override
  Future<void> search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  late final _$SearchViewModelBaseActionController =
      ActionController(name: 'SearchViewModelBase', context: context);

  @override
  void clear() {
    final _$actionInfo = _$SearchViewModelBaseActionController.startAction(
        name: 'SearchViewModelBase.clear');
    try {
      return super.clear();
    } finally {
      _$SearchViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
