import '../core/entities/product_category.dart';
import '../dtos/product_category_dto.dart';
import 'entity_mapper.dart';

class ProductCategoryMapper implements EntityMapper<ProductCategoryDTO, ProductCategory> {
  @override
  ProductCategory toEntity(ProductCategoryDTO it) {
    return ProductCategory.lazy(
      id: it.id,
      title: it.title,
      image: it.image,
    );
  }
}
