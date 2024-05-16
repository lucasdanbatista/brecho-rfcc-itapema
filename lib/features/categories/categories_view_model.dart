import 'package:mobx/mobx.dart';

import '../../core/entities/product_category.dart';
import '../../core/repositories/product_category_repository.dart';

part 'categories_view_model.g.dart';

class CategoriesViewModel = CategoriesViewModelBase with _$CategoriesViewModel;

abstract class CategoriesViewModelBase with Store {
  final ProductCategoryRepository _repository;

  CategoriesViewModelBase(this._repository);

  @observable
  List<ProductCategory> categories = ObservableList();

  @action
  Future<void> fetch() async =>
      categories = ObservableList.of(await _repository.findAll());
}
