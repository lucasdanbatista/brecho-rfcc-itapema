import '../../mappers/order_mapper.dart';
import '../../providers/order_provider.dart';
import '../entities/order.dart';

abstract interface class OrderRepository {
  Future<List<Order>> findAll();
}

class DefaultOrderRepository implements OrderRepository {
  final OrderProvider _provider;
  final OrderMapper _mapper;

  DefaultOrderRepository(this._provider, this._mapper);

  @override
  Future<List<Order>> findAll() async {
    final response = await _provider.getAll();
    return response.map(_mapper.toEntity).toList();
  }
}
