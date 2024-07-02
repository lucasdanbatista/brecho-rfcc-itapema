import 'dart:convert';

import '../../mappers/product_mapper.dart';
import '../../providers/product_category_provider.dart';
import '../../providers/product_provider.dart';
import '../entities/product.dart';

abstract interface class ProductRepository {
  Future<Product> findById(String id);

  Future<List<Product>> findAllByIds(List<String> ids);

  Future<List<Product>> findAllByCategoryId(String id);

  Future<List<Product>> findProductsByTerm(String term);
}

class DefaultProductRepository implements ProductRepository {
  final ProductProvider _productProvider;
  final ProductCategoryProvider _categoryProvider;
  final ProductMapper _mapper;

  DefaultProductRepository(
    this._productProvider,
    this._categoryProvider,
    this._mapper,
  );

  @override
  Future<Product> findById(String id) async {
    final response = await _productProvider.findProductById(id);
    return _mapper.toEntity(response);
  }

  @override
  Future<List<Product>> findAllByIds(List<String> ids) async {
    final response = await _productProvider.findAllByIds(ids.join(','));
    return response.map(_mapper.toEntity).toList();
  }

  @override
  Future<List<Product>> findAllByCategoryId(String id) async {
    final response = await _categoryProvider.findAllProductsByCategoryId(id);
    final products = await Future.wait(
      response.map((e) => _productProvider.findProductById(e.id!)),
    );
    return products.map(_mapper.toEntity).toList();
  }

  @override
  Future<List<Product>> findProductsByTerm(String term) async {
    final response = await _productProvider.findProductsByTerm(
      base64Encode(utf8.encode(term.trim())),
    );
    return response.map(_mapper.toEntity).toList();
  }
}
