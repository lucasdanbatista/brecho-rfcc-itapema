import 'entity.dart';

class ProductCategory implements Entity {
  late final String id;
  late final String title;
  final Uri? image;

  ProductCategory.lazy({
    String? id,
    String? title,
    this.image,
  }) {
    if (id != null) this.id = id;
    if (title != null) this.title = title;
  }
}
