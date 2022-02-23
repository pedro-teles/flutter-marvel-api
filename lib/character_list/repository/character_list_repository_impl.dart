import 'package:marvel_api/commons/connector/character_service.dart';
import 'package:marvel_api/character_list/repository/character_list_repository.dart';
import 'package:marvel_api/character_list/usecase/model/character_model.dart';

class CharacterListRepositoryImpl implements CharacterListRepository {
  CharacterListRepositoryImpl(this.service);

  final CharacterService service;

  @override
  Future<List<Character>> getCharacterList() async {
    final response = await service.getCharacterList();

    if (response != null) {
      return response.characterData!.results!
          .map(
            (character) => Character(
              character.id ?? 0,
              character.name ?? '',
              '${character.thumbnail?.path}/landscape_incredible.${character.thumbnail?.extension ?? ''}',
            ),
          )
          .toList();
    }

    return List.empty();
  }
}
