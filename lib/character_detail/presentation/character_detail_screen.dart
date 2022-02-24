import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/character_detail/bloc/state/character_detail_state.dart';
import 'package:marvel_api/character_detail/repository/character_detail_repository.dart';
import 'package:marvel_api/character_detail/usecase/character_detail_usecase.dart';
import 'package:marvel_api/character_list/usecase/model/character_model.dart';
import 'package:marvel_api/commons/components/loading_screen.dart';
import 'package:provider/provider.dart';

class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  CharacterDetailCubit(this.useCase) : super(LoadingDetail());

  final CharacterDetailUseCase useCase;

  void getCharacterDetail(int characterId) async {
    final character = await useCase.getCharacterDetail(characterId);

    emit(LoadedDetail(character));
  }
}

class ChracterDetailContainer extends StatelessWidget {
  const ChracterDetailContainer({
    Key? key,
    required this.characterId,
    required this.characterName,
  }) : super(key: key);

  final int characterId;
  final String characterName;

  @override
  Widget build(BuildContext context) {
    final CharacterDetailUseCase useCase =
        Provider.of<CharacterDetailUseCase>(context);

    return BlocProvider(
      create: (_) {
        final cubit = CharacterDetailCubit(useCase);

        cubit.getCharacterDetail(characterId);

        return cubit;
      },
      child: CharacterDetailScreen(
        characterName: characterName,
      ),
    );
  }
}

class CharacterDetailScreen extends StatelessWidget {
  CharacterDetailScreen({
    required this.characterName,
  });

  final String characterName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(characterName),
      ),
      body: BlocBuilder<CharacterDetailCubit, CharacterDetailState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case LoadingDetail:
              return LoadingScreen();
            case LoadedDetail:
              return Container();
            case Error:
            default:
              return const Text('Error');
          }
        },
      ),
    );
  }
}
