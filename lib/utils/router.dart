import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: CategoriesRoute.page,
          path: '/categories',
          children: [
            AutoRoute(
              page: CategoryDetailsRoute.page,
              path: 'details',
            ),
          ],
        ),
        AutoRoute(
          page: ProductDetailsRoute.page,
          path: '/product-details',
        ),
        AutoRoute(
          page: CartRoute.page,
          path: '/cart',
        ),
        AutoRoute(
          page: CheckoutRoute.page,
          path: '/checkout',
        ),
      ];
}
