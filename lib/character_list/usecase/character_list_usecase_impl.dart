import 'package:marvel_api/character_list/repository/character_list_repository.dart';
import 'package:marvel_api/character_list/usecase/character_list_usecase.dart';
import 'package:marvel_api/character_list/usecase/model/character_model.dart';

class CharacterListUseCaseImpl implements CharacterListUseCase {
  CharacterListUseCaseImpl(this.repository);

  final CharacterListRepository repository;

  @override
  Future<List<Character>> getCharacterList() async {
    final characterList = repository.getCharacterList();

    return characterList;
  }
}
