import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/entities/order.dart';
import '../../../utils/formatters/order_formatter.dart';
import '../../../utils/router.gr.dart';

class OrderListTile extends StatelessWidget {
  final Order order;

  const OrderListTile(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = OrderFormatter(order);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(
          width: 2,
          strokeAlign: BorderSide.strokeAlignOutside,
          color: Colors.grey.shade200,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 8, 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Pedido ',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                      text: '#${order.orderNumber}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 72, right: 8),
                  child: Text(
                    formatter.statusText.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: formatter.statusColor),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Text(
              formatter.title,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      constraints: const BoxConstraints(
                        maxHeight: 100,
                        maxWidth: 100,
                      ),
                      child: GridView.count(
                        childAspectRatio: 1,
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: order.items
                            .take(4)
                            .map(
                              (e) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: order.items.indexOf(e) == 3
                                    ? Center(
                                        child: Text(
                                          '+${order.items.length - 3}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.grey.shade600,
                                              ),
                                        ),
                                      )
                                    : Image.network(
                                        e.productVariant.image.toString(),
                                      ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => context.pushRoute(
                    OrderDetailsRoute(
                      order: order,
                    ),
                  ),
                  child: const Text('VER DETALHES'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
