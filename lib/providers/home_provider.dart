import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/home_banner_dto.dart';
import '../dtos/home_section_dto.dart';

part 'home_provider.g.dart';

@RestApi(baseUrl: '/')
abstract class HomeProvider {
  factory HomeProvider(Dio dio) = _HomeProvider;

  @GET('/banners')
  Future<List<HomeBannerDTO>> getBanners();

  @GET('/sections')
  Future<List<HomeSectionDTO>> getSections();
}
