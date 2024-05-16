import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../features/cart/cart_view_model.dart';
import '../../utils/router.gr.dart';

class CartIconButton extends StatelessWidget {
  final viewModel = GetIt.I<CartViewModel>();

  CartIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pushRoute(CartRoute()),
      icon: Observer(
        builder: (context) => Badge.count(
          isLabelVisible: viewModel.cart.lines.isNotEmpty,
          count: viewModel.cart.lines.length,
          child: const Icon(Icons.shopping_cart_outlined),
        ),
      ),
    );
  }
}
