import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: CategoriesRoute.page),
        AutoRoute(page: CategoryDetailsRoute.page),
        AutoRoute(page: ProductDetailsRoute.page),
        AutoRoute(page: CartRoute.page),
        AutoRoute(page: OrdersRoute.page),
        AutoRoute(page: OrderDetailsRoute.page),
        AutoRoute(page: CheckoutRoute.page),
        AutoRoute(page: BannerDetailsRoute.page),
      ];
}
