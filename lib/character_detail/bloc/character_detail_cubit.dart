import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/character_detail/bloc/state/character_detail_state.dart';
import 'package:marvel_api/character_detail/usecase/character_detail_usecase.dart';

class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  CharacterDetailCubit(this.useCase) : super(LoadingDetail());

  final CharacterDetailUseCase useCase;

  void getCharacterDetail(int characterId) async {
    final character = await useCase.getCharacterDetail(characterId);

    emit(LoadedDetail(character));
  }
}
