import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../core/entities/home_banner.dart';
import '../../utils/init_state_mixin.dart';
import '../../widgets/grid_views/product_grid_view.dart';
import 'banner_details_view_model.dart';

@RoutePage()
class BannerDetailsPage extends StatelessWidget with InitStateMixin {
  final HomeBanner banner;
  final viewModel = GetIt.I<BannerDetailsViewModel>();

  BannerDetailsPage({
    super.key,
    required this.banner,
  });

  @override
  void initState() {
    viewModel.fetchProducts(banner.productIds);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(banner.title),
      ),
      body: Observer(
        builder: (context) => ProductGridView(viewModel.products),
      ),
    );
  }
}
