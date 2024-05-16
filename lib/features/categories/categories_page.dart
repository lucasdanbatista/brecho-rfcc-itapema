import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../utils/router.gr.dart';
import 'categories_view_model.dart';

@RoutePage()
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with AutomaticKeepAliveClientMixin {
  final categoriesViewModel = GetIt.I<CategoriesViewModel>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: categoriesViewModel.categories.length,
          itemBuilder: (context, index) {
            final category = categoriesViewModel.categories[index];
            return ListTile(
              minVerticalPadding: 20,
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey.shade200,
                foregroundImage: category.image != null
                    ? NetworkImage(category.image.toString())
                    : null,
              ),
              title: Text(
                category.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              onTap: () => context.pushRoute(
                CategoryDetailsRoute(
                  category: category,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
