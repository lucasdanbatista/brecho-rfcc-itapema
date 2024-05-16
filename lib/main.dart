import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import 'core/auth_manager.dart';
import 'core/cart_manager.dart';
import 'core/core_module.dart';
import 'core/module.dart';
import 'features/banner_details/banner_details_module.dart';
import 'features/cart/cart_module.dart';
import 'features/categories/categories_module.dart';
import 'features/category_details/category_details_module.dart';
import 'features/home/home_module.dart';
import 'features/orders/orders_module.dart';
import 'features/product_details/product_details_module.dart';
import 'features/search/search_module.dart';
import 'features/sign_in/sign_in_module.dart';
import 'mappers/mappers_module.dart';
import 'providers/providers_module.dart';
import 'utils/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'pt_BR';
  await Module.initAll([
    CoreModule(),
    MappersModule(),
    ProvidersModule(),
    SignInModule(),
    CategoriesModule(),
    CategoryDetailsModule(),
    ProductDetailsModule(),
    CartModule(),
    OrdersModule(),
    SearchModule(),
    HomeModule(),
    BannerDetailsModule(),
  ]);
  final authManager = GetIt.I<AuthManager>();
  await authManager.loadCredentials();
  if (authManager.isAuthenticated) {
    await GetIt.I<CartManager>().loadCurrentCart();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      routerConfig: router.config(),
    );
  }
}
