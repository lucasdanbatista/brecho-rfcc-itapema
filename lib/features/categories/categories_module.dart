import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'categories_view_model.dart';

class CategoriesModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerLazySingleton(() => CategoriesViewModel(i.get()));
  }
}
