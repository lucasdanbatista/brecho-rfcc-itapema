// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:vienna/core/entities/home_banner.dart' as _i12;
import 'package:vienna/core/entities/order.dart' as _i14;
import 'package:vienna/core/entities/product_category.dart' as _i13;
import 'package:vienna/features/banner_details/banner_details_page.dart' as _i1;
import 'package:vienna/features/cart/cart_page.dart' as _i2;
import 'package:vienna/features/categories/categories_page.dart' as _i3;
import 'package:vienna/features/category_details/category_details_page.dart'
    as _i4;
import 'package:vienna/features/checkout/checkout_page.dart' as _i5;
import 'package:vienna/features/home/home_page.dart' as _i6;
import 'package:vienna/features/order_details/order_details_page.dart' as _i7;
import 'package:vienna/features/orders/orders_page.dart' as _i8;
import 'package:vienna/features/product_details/product_details_page.dart'
    as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    BannerDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BannerDetailsRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BannerDetailsPage(
          key: args.key,
          banner: args.banner,
        ),
      );
    },
    CartRoute.name: (routeData) {
      final args =
          routeData.argsAs<CartRouteArgs>(orElse: () => const CartRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CartPage(key: args.key),
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CategoriesPage(),
      );
    },
    CategoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailsRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CategoryDetailsPage(
          key: args.key,
          category: args.category,
        ),
      );
    },
    CheckoutRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CheckoutPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomePage(key: args.key),
      );
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.OrderDetailsPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    OrdersRoute.name: (routeData) {
      final args = routeData.argsAs<OrdersRouteArgs>(
          orElse: () => const OrdersRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.OrdersPage(key: args.key),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ProductDetailsPage(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.BannerDetailsPage]
class BannerDetailsRoute extends _i10.PageRouteInfo<BannerDetailsRouteArgs> {
  BannerDetailsRoute({
    _i11.Key? key,
    required _i12.HomeBanner banner,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          BannerDetailsRoute.name,
          args: BannerDetailsRouteArgs(
            key: key,
            banner: banner,
          ),
          initialChildren: children,
        );

  static const String name = 'BannerDetailsRoute';

  static const _i10.PageInfo<BannerDetailsRouteArgs> page =
      _i10.PageInfo<BannerDetailsRouteArgs>(name);
}

class BannerDetailsRouteArgs {
  const BannerDetailsRouteArgs({
    this.key,
    required this.banner,
  });

  final _i11.Key? key;

  final _i12.HomeBanner banner;

  @override
  String toString() {
    return 'BannerDetailsRouteArgs{key: $key, banner: $banner}';
  }
}

/// generated route for
/// [_i2.CartPage]
class CartRoute extends _i10.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          CartRoute.name,
          args: CartRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i10.PageInfo<CartRouteArgs> page =
      _i10.PageInfo<CartRouteArgs>(name);
}

class CartRouteArgs {
  const CartRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.CategoriesPage]
class CategoriesRoute extends _i10.PageRouteInfo<void> {
  const CategoriesRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CategoryDetailsPage]
class CategoryDetailsRoute
    extends _i10.PageRouteInfo<CategoryDetailsRouteArgs> {
  CategoryDetailsRoute({
    _i11.Key? key,
    required _i13.ProductCategory category,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          CategoryDetailsRoute.name,
          args: CategoryDetailsRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryDetailsRoute';

  static const _i10.PageInfo<CategoryDetailsRouteArgs> page =
      _i10.PageInfo<CategoryDetailsRouteArgs>(name);
}

class CategoryDetailsRouteArgs {
  const CategoryDetailsRouteArgs({
    this.key,
    required this.category,
  });

  final _i11.Key? key;

  final _i13.ProductCategory category;

  @override
  String toString() {
    return 'CategoryDetailsRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i5.CheckoutPage]
class CheckoutRoute extends _i10.PageRouteInfo<void> {
  const CheckoutRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CheckoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i10.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<HomeRouteArgs> page =
      _i10.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.OrderDetailsPage]
class OrderDetailsRoute extends _i10.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    _i11.Key? key,
    required _i14.Order order,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          OrderDetailsRoute.name,
          args: OrderDetailsRouteArgs(
            key: key,
            order: order,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailsRoute';

  static const _i10.PageInfo<OrderDetailsRouteArgs> page =
      _i10.PageInfo<OrderDetailsRouteArgs>(name);
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    this.key,
    required this.order,
  });

  final _i11.Key? key;

  final _i14.Order order;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i8.OrdersPage]
class OrdersRoute extends _i10.PageRouteInfo<OrdersRouteArgs> {
  OrdersRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          OrdersRoute.name,
          args: OrdersRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const _i10.PageInfo<OrdersRouteArgs> page =
      _i10.PageInfo<OrdersRouteArgs>(name);
}

class OrdersRouteArgs {
  const OrdersRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'OrdersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ProductDetailsPage]
class ProductDetailsRoute extends _i10.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i11.Key? key,
    required String productId,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i10.PageInfo<ProductDetailsRouteArgs> page =
      _i10.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.productId,
  });

  final _i11.Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, productId: $productId}';
  }
}
