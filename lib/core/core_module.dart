import 'package:get_it/get_it.dart';

import 'cart_manager.dart';
import 'environment.dart';
import 'module.dart';
import 'repositories/home_repository.dart';
import 'repositories/order_repository.dart';
import 'repositories/product_category_repository.dart';
import 'repositories/product_repository.dart';

class CoreModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerLazySingleton(() => Environment.auto());
    i.registerLazySingleton<CartManager>(() => InMemoryCartManager(i.get()));
    i.registerLazySingleton<ProductRepository>(
      () => DefaultProductRepository(i.get(), i.get(), i.get()),
    );
    i.registerLazySingleton<ProductCategoryRepository>(
      () => DefaultProductCategoryRepository(i.get(), i.get()),
    );
    i.registerLazySingleton<HomeRepository>(
      () => DefaultHomeRepository(i.get(), i.get(), i.get()),
    );
    i.registerLazySingleton<OrderRepository>(
      () => DefaultOrderRepository(i.get(), i.get()),
    );
  }
}
