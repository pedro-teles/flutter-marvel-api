import 'package:marvel_api/character_detail/repository/character_detail_repository.dart';
import 'package:marvel_api/character_list/usecase/model/character_model.dart';
import 'package:marvel_api/commons/connector/character_service.dart';

class CharacterDetailRepositoryImpl implements CharacterDetaiLRepository {
  CharacterDetailRepositoryImpl(this.service);

  final CharacterService service;

  @override
  Future<Character> getCharacterDetail(int characterId) async {
    final detailResponse = await service.getCharacterDetail(characterId);
    final characterData = detailResponse?.data.results?.first;

    return Character(
      characterId,
      characterData?.name ?? '',
      '${characterData?.thumbnail.path}/portrait_uncanny.${characterData?.thumbnail.extension}',
    );
  }
}
