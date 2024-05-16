import 'package:flutter/material.dart';

import '../../core/entities/order.dart';
import '../../core/entities/order_status.dart';

class OrderFormatter {
  final Order _order;

  OrderFormatter(this._order);

  String get title {
    var title = '';
    for (final item in _order.items) {
      title += item.title;
      if (item != _order.items.last) {
        title += ' + ';
      }
    }
    return title;
  }

  String get shippingAddress =>
      '${_order.shippingAddress.addressLine1}, ${_order.shippingAddress.addressLine2}. '
      '${_order.shippingAddress.city}, ${_order.shippingAddress.state}, '
      'CEP: ${_order.shippingAddress.zipcode}.';

  String get statusText => switch (_order.status) {
        OrderStatus.paid => 'Pagamento aprovado',
        OrderStatus.processing => 'Processando pedido',
        OrderStatus.unknownStatus => 'Status desconhecido',
      };

  Color? get statusColor => switch (_order.status) {
        OrderStatus.paid => Colors.green.shade700,
        OrderStatus.processing => Colors.orange.shade700,
        OrderStatus.unknownStatus => null,
      };
}
