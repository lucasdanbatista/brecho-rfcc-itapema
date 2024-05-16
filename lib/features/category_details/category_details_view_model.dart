import 'package:mobx/mobx.dart';

import '../../core/entities/product.dart';
import '../../core/repositories/product_repository.dart';

part 'category_details_view_model.g.dart';

class CategoryDetailsViewModel = CategoryDetailsViewModelBase
    with _$CategoryDetailsViewModel;

abstract class CategoryDetailsViewModelBase with Store {
  final ProductRepository _repository;

  CategoryDetailsViewModelBase(this._repository);

  @observable
  List<Product> products = ObservableList();

  @action
  Future<void> fetch(String id) async =>
      products = ObservableList.of(await _repository.findAllByCategoryId(id));
}
