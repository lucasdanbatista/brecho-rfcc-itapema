import 'package:mobx/mobx.dart';

import '../../core/entities/product.dart';
import '../../core/repositories/product_repository.dart';

part 'banner_details_view_model.g.dart';

class BannerDetailsViewModel = BannerDetailsViewModelBase
    with _$BannerDetailsViewModel;

abstract class BannerDetailsViewModelBase with Store {
  final ProductRepository _productRepository;

  BannerDetailsViewModelBase(this._productRepository);

  @observable
  List<Product> products = ObservableList();

  @action
  Future<void> fetchProducts(List<String> productIds) async {
    products = ObservableList.of(
      await _productRepository.findAllByIds(productIds),
    );
  }
}
