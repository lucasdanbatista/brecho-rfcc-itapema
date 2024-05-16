import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'product_details_view_model.dart';

class ProductDetailsModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerFactory(() => ProductDetailsViewModel(i.get()));
  }
}
