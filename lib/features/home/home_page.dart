import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../utils/assets.dart';
import '../../utils/init_state_mixin.dart';
import '../../utils/router.gr.dart';
import '../../widgets/cards/product_card.dart';
import '../../widgets/icon_buttons/cart_icon_button.dart';
import '../cart/cart_view_model.dart';
import '../categories/categories_view_model.dart';
import 'home_view_model.dart';

@RoutePage()
class HomePage extends StatelessWidget with InitStateMixin {
  final categoriesViewModel = GetIt.I<CategoriesViewModel>();
  final homeViewModel = GetIt.I<HomeViewModel>();
  final cartViewModel = GetIt.I<CartViewModel>();

  HomePage({super.key});

  @override
  void initState() async {
    homeViewModel.fetchSections();
    categoriesViewModel.fetch();
    cartViewModel.refreshCart();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: Container(
                      color: ColorAssets.storeLogoTransparentBackgroundColor,
                      child: Image.asset(
                        ImageAssets.storeLogoTransparent,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  ListTile(
                    style: ListTileStyle.drawer,
                    title: const Text('Categorias'),
                    leading: const Icon(Icons.category_outlined),
                    onTap: () => context.pushRoute(const CategoriesRoute()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('RFCC Itapema'),
        actions: [
          CartIconButton(),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categorias',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    TextButton(
                      onPressed: () =>
                          context.pushRoute(const CategoriesRoute()),
                      child: const Text('VER TODAS'),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 24)),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 96 + 24 + 12,
                  child: Observer(
                    builder: (context) => GridView.count(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 1,
                      children: categoriesViewModel.categories
                          .map(
                            (category) => Column(
                              children: [
                                Container(
                                  width: 96,
                                  height: 96,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.grey.shade200,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                  ),
                                  child: Material(
                                    clipBehavior: Clip.antiAlias,
                                    shape: const CircleBorder(),
                                    child: Ink.image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        category.image.toString(),
                                      ),
                                      child: InkWell(
                                        onTap: () => context.pushRoute(
                                          CategoryDetailsRoute(
                                            category: category,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 12),
                                ),
                                Expanded(
                                  child: Text(
                                    category.title,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 32)),
            Observer(
              builder: (context) => Wrap(
                direction: Axis.vertical,
                spacing: 24,
                children: homeViewModel.sections
                    .map(
                      (section) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            section.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const Padding(padding: EdgeInsets.only(top: 16)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 220,
                            child: ListView(
                              clipBehavior: Clip.none,
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(right: 24),
                              scrollDirection: Axis.horizontal,
                              children: section.products
                                  .map(
                                    (product) => Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: AspectRatio(
                                        aspectRatio: 3 / 4,
                                        child: ProductCard(product),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
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
