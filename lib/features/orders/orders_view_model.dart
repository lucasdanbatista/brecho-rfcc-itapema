import 'package:mobx/mobx.dart';

import '../../core/entities/order.dart';
import '../../core/repositories/order_repository.dart';

part 'orders_view_model.g.dart';

class OrdersViewModel = OrdersViewModelBase with _$OrdersViewModel;

abstract class OrdersViewModelBase with Store {
  final OrderRepository _repository;

  OrdersViewModelBase(this._repository);

  @observable
  List<Order> orders = ObservableList();

  @action
  Future<void> fetch() async => orders = ObservableList.of(await _repository.findAll());
}
