import 'package:marvel_api/character_detail/repository/character_detail_repository.dart';
import 'package:marvel_api/character_list/usecase/model/character_model.dart';

import 'character_detail_usecase.dart';

class CharacterDetailUseCaseImpl implements CharacterDetailUseCase {
  CharacterDetailUseCaseImpl(this.repository);

  final CharacterDetaiLRepository repository;

  @override
  Future<Character> getCharacterDetail(int characterId) =>
      repository.getCharacterDetail(characterId);
}
