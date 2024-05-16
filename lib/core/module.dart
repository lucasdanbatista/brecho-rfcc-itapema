import 'package:get_it/get_it.dart';

abstract interface class Module {
  Future<void> init(GetIt i);

  static Future<void> initAll(List<Module> modules) async {
    for (final module in modules) {
      await module.init(GetIt.instance);
    }
  }
}
