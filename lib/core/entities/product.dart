import 'entity.dart';
import 'product_option.dart';
import 'product_variant.dart';

class Product implements Entity {
  late final String id;
  late final String title;
  late final String description;
  late final List<Uri> images;
  late final List<ProductVariant> variants;
  late final List<ProductOption> options;

  Product.lazy({
    String? id,
    String? title,
    String? description,
    List<Uri>? images,
    List<ProductVariant>? variants,
    List<ProductOption>? options,
  }) {
    if (id != null) this.id = id;
    if (title != null) this.title = title;
    if (description != null) this.description = description;
    if (images != null) this.images = images;
    if (variants != null) this.variants = variants;
    if (options != null) this.options = options;
  }
}
