import 'entity.dart';

class HomeBanner implements Entity {
  late final String title;
  late final Uri image;
  late final List<String> productIds;

  HomeBanner.lazy({
    String? title,
    Uri? image,
    List<String>? productIds,
  }) {
    if (title != null) this.title = title;
    if (image != null) this.image = image;
    if (productIds != null) this.productIds = productIds;
  }
}
