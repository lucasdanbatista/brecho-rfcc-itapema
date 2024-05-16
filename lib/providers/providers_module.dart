import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/environment.dart';
import '../../core/module.dart';
import 'cart_provider.dart';
import 'customer_provider.dart';
import 'home_provider.dart';
import 'order_provider.dart';
import 'product_category_provider.dart';
import 'product_provider.dart';
import 'wishlist_provider.dart';

class ProvidersModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    final tmpDir = await getTemporaryDirectory();
    i.registerLazySingleton(
      () => Dio(
        BaseOptions(
          baseUrl: i.get<Environment>().apiBaseUrl.toString(),
        ),
      )..interceptors.add(
          DioCacheInterceptor(
            options: CacheOptions(
              store: HiveCacheStore(tmpDir.path),
              hitCacheOnErrorExcept: [401, 403],
            ),
          ),
        ),
    );
    i.registerLazySingleton(() => CustomerProvider(i.get()));
    i.registerLazySingleton(() => ProductProvider(i.get()));
    i.registerLazySingleton(() => ProductCategoryProvider(i.get()));
    i.registerLazySingleton(() => CartProvider(i.get()));
    i.registerLazySingleton(() => HomeProvider(i.get()));
    i.registerLazySingleton<WishlistProvider>(
      () => LocalWishlistProvider(i.get(), i.get()),
    );
    i.registerLazySingleton(() => OrderProvider(i.get()));
  }
}
