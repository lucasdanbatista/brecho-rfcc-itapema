import '../../mappers/product_category_mapper.dart';
import '../../providers/product_category_provider.dart';
import '../entities/product_category.dart';

abstract interface class ProductCategoryRepository {
  Future<List<ProductCategory>> findAll();
}

class DefaultProductCategoryRepository implements ProductCategoryRepository {
  final ProductCategoryProvider _provider;
  final ProductCategoryMapper _mapper;

  DefaultProductCategoryRepository(this._provider, this._mapper);

  @override
  Future<List<ProductCategory>> findAll() async {
    final response = await _provider.findAll();
    return response.map(_mapper.toEntity).toList();
  }
}
