import '../../dtos/order_reservation_dto.dart';
import '../../providers/checkout_provider.dart';
import '../entities/cart.dart';

abstract interface class CheckoutRepository {
  Future<void> confirmReservation({
    required String customerName,
    required String customerPhone,
    required Cart cart,
  });
}

class DefaultCheckoutRepository implements CheckoutRepository {
  final CheckoutProvider _checkoutProvider;

  DefaultCheckoutRepository(this._checkoutProvider);

  @override
  Future<void> confirmReservation({
    required String customerName,
    required String customerPhone,
    required Cart cart,
  }) =>
      _checkoutProvider.confirmReservation(
        OrderReservationDTO(
          customerName: customerName,
          customerPhone: customerPhone,
          productVariantIds:
              cart.lines.map((e) => e.productVariant.id).toList(),
          total: cart.total,
        ),
      );
}
