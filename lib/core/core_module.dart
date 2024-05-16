import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import 'auth_manager.dart';
import 'cart_manager.dart';
import 'database_scheme.dart';
import 'environment.dart';
import 'module.dart';
import 'repositories/cart_repository.dart';
import 'repositories/home_repository.dart';
import 'repositories/order_repository.dart';
import 'repositories/product_category_repository.dart';
import 'repositories/product_repository.dart';
import 'repositories/wishlist_repository.dart';
import 'wishlist_manager.dart';

class CoreModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerLazySingleton<Environment>(() => DebugEnvironment());
    i.registerLazySingleton(() => const FlutterSecureStorage());
    i.registerLazySingleton<WishlistManager>(
      () => DefaultWishlistManager(i.get()),
    );
    i.registerLazySingleton<AuthManager>(
      () => DefaultAuthManager(i.get(), i.get(), i.get()),
    );
    i.registerLazySingleton<CartManager>(
      () => DefaultCartManager(i.get(), i.get()),
    );
    i.registerLazySingleton<ProductRepository>(
      () => DefaultProductRepository(i.get(), i.get(), i.get()),
    );
    i.registerLazySingleton<ProductCategoryRepository>(
      () => DefaultProductCategoryRepository(i.get(), i.get()),
    );
    i.registerLazySingleton<HomeRepository>(
      () => DefaultHomeRepository(i.get(), i.get(), i.get()),
    );
    i.registerLazySingleton<CartRepository>(
      () => DefaultCartRepository(i.get(), i.get()),
    );
    i.registerLazySingleton<WishlistRepository>(
      () => DefaultWishlistRepository(i.get(), i.get()),
    );
    i.registerLazySingleton<OrderRepository>(
      () => DefaultOrderRepository(i.get(), i.get()),
    );
    final database = await openDatabase(
      DatabaseScheme.databaseName,
      version: DatabaseScheme.latest().version,
      onConfigure: (db) => db.execute(DatabaseScheme.globalConfigurations),
      onUpgrade: (db, oldVersion, newVersion) async {
        final scheme = DatabaseScheme.migrate(oldVersion, newVersion);
        for (final table in scheme.tables) {
          await db.execute(table);
        }
      },
      onCreate: (db, version) async {
        for (final table in DatabaseScheme.latest().tables) {
          await db.execute(table);
        }
      },
    );
    i.registerSingleton(database);
  }
}
