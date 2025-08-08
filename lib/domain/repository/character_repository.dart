import 'package:injectable/injectable.dart';
import 'package:rick_and_morty_flutter_test/core/network/http_client.dart';
import 'package:rick_and_morty_flutter_test/domain/entitiy/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters();
  Future<Character> getCharacterById(int id);
}

@Singleton(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  final HttpClient _httpClient;

  CharacterRepositoryImpl(this._httpClient);

  @override
  Future<List<Character>> getCharacters() async {
    final response = await _httpClient.get('https://rickandmortyapi.com/api/character');
    final results = response['results'] as List;

    return results.map((json) => Character.fromJson(json as Map<String, dynamic>)).toList();
  }

  @override
  Future<Character> getCharacterById(int id) async {
    final response = await _httpClient.get('https://rickandmortyapi.com/api/character/$id');

    return Character.fromJson(response);
  }
}
