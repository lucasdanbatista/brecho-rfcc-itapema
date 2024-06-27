import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/order_reservation_dto.dart';

part 'checkout_provider.g.dart';

@RestApi(baseUrl: '/v1/checkout')
abstract class CheckoutProvider {
  factory CheckoutProvider(Dio dio) = _CheckoutProvider;

  @POST('/confirm-reservation')
  Future<void> confirmReservation(@Body() OrderReservationDTO reservation);
}
