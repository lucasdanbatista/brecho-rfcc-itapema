import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'home_view_model.dart';

class HomeModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerLazySingleton(() => HomeViewModel(i.get()));
  }
}
