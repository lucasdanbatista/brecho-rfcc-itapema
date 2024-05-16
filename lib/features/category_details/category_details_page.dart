import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../core/entities/product_category.dart';
import '../../utils/init_state_mixin.dart';
import '../../widgets/grid_views/product_grid_view.dart';
import 'category_details_view_model.dart';

@RoutePage()
class CategoryDetailsPage extends StatelessWidget with InitStateMixin {
  final ProductCategory category;
  final viewModel = GetIt.I<CategoryDetailsViewModel>();

  CategoryDetailsPage({
    super.key,
    required this.category,
  });

  @override
  void initState() {
    viewModel.fetch(category.id);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Observer(
        builder: (context) => ProductGridView(viewModel.products),
      ),
    );
  }
}
