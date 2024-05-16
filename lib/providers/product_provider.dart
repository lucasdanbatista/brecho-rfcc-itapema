import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/product_dto.dart';

part 'product_provider.g.dart';

@RestApi(baseUrl: '/v1/products')
abstract class ProductProvider {
  factory ProductProvider(Dio dio) = _ProductProvider;

  @GET('/{id}')
  Future<ProductDTO> findProductById(@Path('id') String id);

  @GET('')
  Future<List<ProductDTO>> findAllByIds(@Query('ids') String ids);

  @GET('/search')
  Future<List<ProductDTO>> findProductsByTerm(@Query('term') String term);
}
