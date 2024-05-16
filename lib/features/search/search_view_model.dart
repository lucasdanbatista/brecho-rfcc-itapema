import 'dart:async';

import 'package:mobx/mobx.dart';

import '../../core/entities/product.dart';
import '../../core/repositories/product_repository.dart';
import '../../utils/cron.dart';

part 'search_view_model.g.dart';

class SearchViewModel = SearchViewModelBase with _$SearchViewModel;

abstract class SearchViewModelBase with Store {
  final ProductRepository _productRepository;
  Timer? typingDelay;

  SearchViewModelBase(this._productRepository);

  @observable
  List<Product> products = ObservableList();

  @action
  Future<void> search(String term) async {
    typingDelay?.cancel();
    typingDelay = Timer(
      400.milliseconds,
      () async {
        if (term.trim().isEmpty) {
          clear();
        } else {
          products = ObservableList.of(
            await _productRepository.findProductsByTerm(term),
          );
        }
      },
    );
  }

  @action
  void clear() {
    typingDelay?.cancel();
    products = ObservableList();
  }
}
