import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../utils/assets.dart';
import '../../utils/formatters/currency_formatter.dart';
import '../../utils/router.gr.dart';
import '../../widgets/order_summary.dart';
import 'cart_view_model.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  final viewModel = GetIt.I<CartViewModel>();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Observer(
        builder: (context) {
          if (viewModel.cart.lines.isEmpty) {
            return Center(
              child: Wrap(
                spacing: 32,
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(
                    ImageAssets.emptyCartIllustration,
                    height: 156,
                  ),
                  const Text('Seu carrinho está vazio'),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: viewModel.cart.lines.length,
            itemBuilder: (context, index) {
              final cartLine = viewModel.cart.lines[index];
              return ListTile(
                title: Text(
                  cartLine.productVariant.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(CurrencyFormatter().format(cartLine.total)),
                onTap: () => context.pushRoute(
                  ProductDetailsRoute(
                    productId: cartLine.productVariant.productId,
                  ),
                ),
                minVerticalPadding: 24,
                contentPadding: const EdgeInsets.only(left: 16, right: 8),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => viewModel.updateCartLine(
                        cartLine.id,
                        cartLine.quantity - 1,
                      ),
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      cartLine.quantity.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    IconButton(
                      onPressed: () => viewModel.updateCartLine(
                        cartLine.id,
                        cartLine.quantity + 1,
                      ),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      cartLine.productVariant.image.toString(),
                      fit: BoxFit.contain,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      persistentFooterAlignment: AlignmentDirectional.topStart,
      persistentFooterButtons: [
        Observer(
          builder: (context) => OrderSummary(
            confirmationButtonText: 'RESERVAR PEDIDO',
            showConfirmationButton: viewModel.cart.lines.isNotEmpty,
            lines: [
              OrderSummaryLine(
                title: 'Subtotal',
                textValue: CurrencyFormatter().format(viewModel.cart.subtotal),
              ),
            ],
            onConfirmationButtonPressed: () => context.pushRoute(
              const CheckoutRoute(),
            ),
          ),
        ),
      ],
    );
  }
}
