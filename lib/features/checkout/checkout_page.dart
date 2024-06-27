import 'dart:js' as js;

import 'package:auto_route/annotations.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/cart_manager.dart';
import '../../utils/formatters/currency_formatter.dart';
import '../../widgets/order_summary.dart';
import 'checkout_view_model.dart';

@RoutePage()
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    super.key,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final cartManager = GetIt.I<CartManager>();
  final viewModel = GetIt.I<CheckoutViewModel>();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Reservar pedido'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: formKey,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome e sobrenome',
                      ),
                      validator: (input) {
                        if (input?.trim().isEmpty == true) {
                          return 'Campo obrigatório.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      validator: (input) {
                        if (input?.trim().isEmpty == true) {
                          return 'Campo obrigatório.';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Telefone',
                      ),
                      inputFormatters: [
                        TextInputMask(
                          mask: '(99) 99999-9999',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              title: const Text('Itens do pedido'),
              initiallyExpanded: true,
              children: cartManager.currentCart.lines
                  .map(
                    (cartLine) => ListTile(
                      title: Text(
                        cartLine.productVariant.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        CurrencyFormatter().format(cartLine.total),
                      ),
                      minVerticalPadding: 24,
                      contentPadding:
                          const EdgeInsets.only(left: 16, right: 32),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            cartLine.quantity.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
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
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        OrderSummary(
          confirmationButtonText: 'CONFIRMAR RESERVA',
          showConfirmationButton: true,
          lines: [
            OrderSummaryLine(
              title: 'Total',
              textValue: CurrencyFormatter().format(
                cartManager.currentCart.total,
              ),
            ),
          ],
          onConfirmationButtonPressed: () async {
            if (formKey.currentState!.validate()) {
              await viewModel.confirmReservation(
                customerName: nameController.text.trim(),
                customerPhone: phoneController.text.trim(),
                cart: cartManager.currentCart,
              );
              await cartManager.initializeNewCart();
              if (context.mounted) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Reserva confirmada!'),
                    content: const Text(
                      'Sua reservada foi confirmada. Entre em contato através do '
                      'nosso telefone para agendar a retirada do(s) produto(s)'
                      'ou compareça diretamente à nossa sede.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          _exitFromCheckout();
                          js.context.callMethod(
                            'open',
                            ['https://maps.app.goo.gl/mWYKpJa8rXeUjroq6'],
                          );
                        },
                        child: const Text('Ver endereço'),
                      ),
                      TextButton(
                        onPressed: () {
                          _exitFromCheckout();
                          js.context.callMethod(
                            'open',
                            ['tel:4733684833'],
                          );
                        },
                        child: const Text('Ligar'),
                      ),
                    ],
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }

  void _exitFromCheckout() => Navigator.of(context)
    ..pop()
    ..pop()
    ..pop()
    ..pop();
}
