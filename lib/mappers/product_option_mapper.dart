import '../core/entities/product_option.dart';
import '../dtos/product_option_dto.dart';
import 'entity_mapper.dart';

class ProductOptionMapper
    implements EntityMapper<ProductOptionDTO, ProductOption> {
  @override
  ProductOption toEntity(ProductOptionDTO it) {
    return ProductOption.lazy(
      id: it.id,
      name: it.name,
      values: it.values,
    );
  }
}
