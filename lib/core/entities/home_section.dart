import 'entity.dart';
import 'product.dart';

class HomeSection implements Entity {
  late final String title;
  late final List<Product> products;

  HomeSection.lazy({
    String? title,
    List<Product>? products,
  }) {
    if (title != null) this.title = title;
    if (products != null) this.products = products;
  }
}
