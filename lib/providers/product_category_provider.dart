import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/product_category_dto.dart';
import '../dtos/product_dto.dart';

part 'product_category_provider.g.dart';

@RestApi(baseUrl: '/v1/categories')
abstract class ProductCategoryProvider {
  factory ProductCategoryProvider(Dio dio) = _ProductCategoryProvider;

  @GET('')
  Future<List<ProductCategoryDTO>> findAll();

  @GET('/{id}/products')
  Future<List<ProductDTO>> findAllProductsByCategoryId(@Path('id') String id);
}
