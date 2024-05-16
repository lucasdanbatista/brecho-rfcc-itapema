import 'package:json_annotation/json_annotation.dart';

enum OrderStatus {
  @JsonValue('PAID')
  paid,
  @JsonValue('PROCESSING')
  processing,
  @JsonValue('UNKNOWN_STATUS')
  unknownStatus,
}
