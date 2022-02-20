import 'package:marvel_api/character_list/usecase/model/character_model.dart';

abstract class CharacterListRepository {
  Future<List<Character>> getCharacterList();
}
