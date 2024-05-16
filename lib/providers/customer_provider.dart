import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/auth_token_dto.dart';

part 'customer_provider.g.dart';

@RestApi(baseUrl: '/v1/customers')
abstract class CustomerProvider {
  factory CustomerProvider(Dio dio) = _CustomerProvider;

  @MultiPart()
  @POST('/sign-in')
  Future<AuthTokenDTO> signIn(
    @Part(name: 'email') String email,
    @Part(name: 'password') String password,
  );

  @MultiPart()
  @POST('/sign-up')
  Future<void> signUp(
    @Part(name: 'name') String name,
    @Part(name: 'email') String email,
    @Part(name: 'password') String password,
  );
}
