import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'banner_details_view_model.dart';

class BannerDetailsModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerFactory(() => BannerDetailsViewModel(i.get()));
  }
}
