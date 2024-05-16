import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'orders_view_model.dart';

class OrdersModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerFactory(() => OrdersViewModel(i.get()));
  }
}
