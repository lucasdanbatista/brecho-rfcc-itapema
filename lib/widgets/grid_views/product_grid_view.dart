import 'package:flutter/material.dart';

import '../../core/entities/product.dart';
import '../cards/product_card.dart';

class ProductGridView extends StatelessWidget {
  final List<Product> products;

  const ProductGridView(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.count(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: products.map((product) => ProductCard(product)).toList(),
      ),
    );
  }
}
