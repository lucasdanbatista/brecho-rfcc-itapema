import '../core/entities/home_section.dart';
import '../dtos/home_section_dto.dart';
import 'entity_mapper.dart';
import 'product_mapper.dart';

class HomeSectionMapper implements EntityMapper<HomeSectionDTO, HomeSection> {
  final ProductMapper _productMapper;

  HomeSectionMapper(this._productMapper);

  @override
  HomeSection toEntity(HomeSectionDTO it) {
    return HomeSection.lazy(
      title: it.title,
      products: it.products?.map(_productMapper.toEntity).toList(),
    );
  }
}
