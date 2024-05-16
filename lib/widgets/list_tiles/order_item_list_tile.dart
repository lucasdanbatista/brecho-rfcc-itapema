import 'package:flutter/material.dart';

import '../../utils/formatters/currency_formatter.dart';

class OrderItemListTile extends StatelessWidget {
  final String productTitle;
  final Uri productImage;
  final int quantity;
  final double total;

  const OrderItemListTile({
    super.key,
    required this.productTitle,
    required this.productImage,
    required this.quantity,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 16,
      leading: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: Image.network(productImage.toString()),
      ),
      title: Text(
        productTitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text.rich(
        TextSpan(
          text: '$quantity un.\n',
          style: Theme.of(context).textTheme.labelSmall,
          children: [
            TextSpan(
              text: CurrencyFormatter().format(total),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}
