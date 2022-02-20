import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/character_list/bloc/state/character_list_state.dart';
import 'package:marvel_api/character_list/usecase/character_list_usecase.dart';

class CharacterListCubit extends Cubit<CharacterListState> {
  CharacterListCubit(this.useCase) : super(LoadingList());

  final CharacterListUseCase useCase;

  void getCharacterList() async {
    final characterList = await useCase.getCharacterList();

    if (characterList.isNotEmpty) {
      emit(LoadedList(characterList));
    } else {
      emit(Error());
    }
  }
}
