import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'search_view_model.dart';

class SearchModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerFactory(() => SearchViewModel(i.get()));
  }
}
