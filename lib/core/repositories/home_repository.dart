import '../../mappers/home_banner_mapper.dart';
import '../../mappers/home_section_mapper.dart';
import '../../providers/home_provider.dart';
import '../../providers/product_provider.dart';
import '../entities/home_banner.dart';
import '../entities/home_section.dart';

abstract interface class HomeRepository {
  Future<List<HomeBanner>> getBanners();

  Future<List<HomeSection>> getSections();
}

class DefaultHomeRepository implements HomeRepository {
  final HomeProvider _provider;
  final HomeSectionMapper _sectionMapper;
  final HomeBannerMapper _bannerMapper;
  final ProductProvider _productProvider;

  DefaultHomeRepository(
    this._provider,
    this._sectionMapper,
    this._bannerMapper,
    this._productProvider,
  );

  @override
  Future<List<HomeBanner>> getBanners() async {
    final response = await _provider.getBanners();
    return response.map(_bannerMapper.toEntity).toList();
  }

  @override
  Future<List<HomeSection>> getSections() async {
    final sections = await _provider.getSections();
    for (final section in sections) {
      section.products = await Future.wait(
        section.productIds!.map(
          (e) => _productProvider.findProductById(e.toString()),
        ),
      );
    }
    return sections.map(_sectionMapper.toEntity).toList();
  }
}
