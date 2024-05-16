import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../utils/init_state_mixin.dart';
import 'orders_view_model.dart';
import 'widgets/order_list_tile.dart';

@RoutePage()
class OrdersPage extends StatelessWidget with InitStateMixin {
  final viewModel = GetIt.I<OrdersViewModel>();

  OrdersPage({super.key});

  @override
  void initState() {
    viewModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Meus pedidos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 72),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
              child: Text(
                'Novos pedidos podem demorar alguns minutos para serem exibidos aqui.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Observer(
              builder: (context) => Column(
                children: viewModel.orders
                    .map(
                      (order) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: OrderListTile(order),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
