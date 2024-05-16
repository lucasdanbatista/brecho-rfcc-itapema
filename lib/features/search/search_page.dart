import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../utils/assets.dart';
import '../../widgets/grid_views/product_grid_view.dart';
import 'search_view_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final viewModel = GetIt.I<SearchViewModel>();
  final termController = TextEditingController();
  final termFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    termFocus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar produtos'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(96),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              focusNode: termFocus,
              controller: termController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'O que você procura?',
                suffixIcon: IconButton(
                  onPressed: () {
                    termController.clear();
                    viewModel.clear();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              onChanged: (term) => viewModel.search(term),
            ),
          ),
        ),
      ),
      body: Observer(
        builder: (context) {
          if (viewModel.products.isEmpty) {
            return Center(
              child: Wrap(
                spacing: 32,
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(
                    ImageAssets.emptySearchIllustration,
                    height: 156,
                  ),
                  const Text('Sem resultados para sua pesquisa'),
                ],
              ),
            );
          }
          return ProductGridView(viewModel.products);
        },
      ),
    );
  }
}
