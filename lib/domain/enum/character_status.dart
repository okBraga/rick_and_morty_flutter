import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum CharacterStatus {
  @JsonValue('Alive')
  alive,
  @JsonValue('Dead')
  dead,
  @JsonValue('unknown')
  unknown,
}
