import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../dtos/order_dto.dart';

part 'order_provider.g.dart';

@RestApi(baseUrl: '/v1/orders')
abstract class OrderProvider {
  factory OrderProvider(Dio dio) = _OrderProvider;

  @GET('')
  Future<List<OrderDTO>> getAll();
}
