import 'package:marvel_api/character_list/usecase/model/character_model.dart';

abstract class CharacterDetailUseCase {
  Future<Character> getCharacterDetail(int characterId);
}
