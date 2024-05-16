import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'wishlist_view_model.dart';

class WishlistModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    GetIt.instance.registerLazySingleton(() => WishlistViewModel(i.get()));
  }
}
