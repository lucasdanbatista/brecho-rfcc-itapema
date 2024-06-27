import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'checkout_view_model.dart';

class CheckoutModule implements Module {
  @override
  Future<void> init(GetIt i) async {
    i.registerFactory(() => CheckoutViewModel(i.get()));
  }
}
