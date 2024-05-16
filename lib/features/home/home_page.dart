import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../core/auth_manager.dart';
import '../../utils/assets.dart';
import '../../utils/init_state_mixin.dart';
import '../../utils/router.gr.dart';
import '../../widgets/cards/product_card.dart';
import '../../widgets/icon_buttons/cart_icon_button.dart';
import '../categories/categories_view_model.dart';
import '../search/search_page.dart';
import 'home_view_model.dart';

@RoutePage()
class HomePage extends StatelessWidget with InitStateMixin {
  final categoriesViewModel = GetIt.I<CategoriesViewModel>();
  final homeViewModel = GetIt.I<HomeViewModel>();
  final authManager = GetIt.I<AuthManager>();

  HomePage({super.key});

  @override
  void initState() {
    homeViewModel.fetchBanners();
    homeViewModel.fetchSections();
    categoriesViewModel.fetch();
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
                    title: const Text('Meus pedidos'),
                    leading: const Icon(Icons.receipt_long_outlined),
                    onTap: () => context.pushRoute(OrdersRoute()),
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton.icon(
                  icon: const Icon(Icons.logout),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Sair da sua conta?'),
                      content: const Text(
                        'Você será redirecionado para a página de login.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            await authManager.signOut();
                            if (context.mounted) {
                              context.replaceRoute(SignInRoute());
                            }
                          },
                          child: const Text('SIM'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('NÃO'),
                        ),
                      ],
                    ),
                  ),
                  label: const Text('SAIR'),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Vienna'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const SearchPage(),
                transitionsBuilder: (_, animation, ___, child) =>
                    SlideTransition(
                  position: animation.drive(
                    Tween(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ),
                  ),
                  child: child,
                ),
              ),
            ),
            icon: const Icon(Icons.search),
          ),
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
              builder: (context) => AspectRatio(
                aspectRatio: 16 / 9,
                child: PageView(
                  controller: PageController(viewportFraction: 0.999),
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: homeViewModel.banners
                      .map(
                        (banner) => Padding(
                          padding: EdgeInsets.only(
                            right:
                                banner != homeViewModel.banners.last ? 12 : 0,
                          ),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                width: 2,
                              ),
                            ),
                            child: Material(
                              child: Ink.image(
                                image: NetworkImage(banner.image.toString()),
                                fit: BoxFit.cover,
                                child: InkWell(
                                  onTap: () => context.pushRoute(
                                    BannerDetailsRoute(banner: banner),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
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
