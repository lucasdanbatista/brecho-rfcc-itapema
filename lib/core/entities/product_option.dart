import 'entity.dart';

class ProductOption implements Entity {
  late final String id;
  late final String name;
  late final List<String> values;

  ProductOption.lazy({
    String? id,
    String? name,
    List<String>? values,
  }) {
    if (id != null) this.id = id;
    if (name != null) this.name = name;
    if (values != null) this.values = values;
  }
}
