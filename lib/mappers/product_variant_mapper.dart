import '../core/entities/product_variant.dart';
import '../dtos/product_variant_dto.dart';
import 'entity_mapper.dart';

class ProductVariantMapper implements EntityMapper<ProductVariantDTO, ProductVariant> {
  @override
  ProductVariant toEntity(ProductVariantDTO it) {
    return ProductVariant.lazy(
      id: it.id,
      productId: it.productId,
      originalPrice: it.originalPrice,
      sellingPrice: it.sellingPrice,
      title: it.title,
      image: it.image,
    );
  }
}
