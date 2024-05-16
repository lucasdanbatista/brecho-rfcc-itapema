import 'package:json_annotation/json_annotation.dart';

part 'auth_token_dto.g.dart';

@JsonSerializable()
class AuthTokenDTO {
  final String accessToken;

  AuthTokenDTO({
    required this.accessToken,
  });

  factory AuthTokenDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenDTOToJson(this);
}
