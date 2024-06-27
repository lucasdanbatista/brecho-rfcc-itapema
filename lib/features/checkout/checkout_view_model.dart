import 'package:mobx/mobx.dart';

import '../../core/entities/cart.dart';
import '../../core/repositories/checkout_repository.dart';

part 'checkout_view_model.g.dart';

class CheckoutViewModel = CheckoutViewModelBase with _$CheckoutViewModel;

abstract class CheckoutViewModelBase with Store {
  final CheckoutRepository _checkoutRepository;

  CheckoutViewModelBase(this._checkoutRepository);

  Future<void> confirmReservation({
    required String customerName,
    required String customerPhone,
    required Cart cart,
  }) =>
      _checkoutRepository.confirmReservation(
        customerName: customerName,
        customerPhone: customerPhone,
        cart: cart,
      );
}
