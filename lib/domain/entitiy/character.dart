import 'package:rick_and_morty_flutter_test/domain/enum/character_status.dart';

import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable(createToJson: false)
class Character {
  final int id;
  final String name;
  final String image;
  final CharacterStatus status;
  final String species;

  Character({required this.id, required this.name, required this.image, required this.status, required this.species});

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
}
