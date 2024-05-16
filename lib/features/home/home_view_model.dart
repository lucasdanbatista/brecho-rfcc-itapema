import 'package:mobx/mobx.dart';

import '../../core/entities/home_banner.dart';
import '../../core/entities/home_section.dart';
import '../../core/repositories/home_repository.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  final HomeRepository _repository;

  HomeViewModelBase(this._repository);

  @observable
  List<HomeBanner> banners = ObservableList();

  @observable
  List<HomeSection> sections = ObservableList();

  @action
  Future<void> fetchBanners() async =>
      banners = ObservableList.of(await _repository.getBanners());

  @action
  Future<void> fetchSections() async =>
      sections = ObservableList.of(await _repository.getSections());
}
