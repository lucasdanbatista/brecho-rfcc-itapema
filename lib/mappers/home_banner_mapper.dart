import '../core/entities/home_banner.dart';
import '../dtos/home_banner_dto.dart';
import 'entity_mapper.dart';

class HomeBannerMapper implements EntityMapper<HomeBannerDTO, HomeBanner> {
  @override
  HomeBanner toEntity(HomeBannerDTO it) {
    return HomeBanner.lazy(
      title: it.title,
      image: it.image,
      productIds: it.productIds,
    );
  }
}
