import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/character_detail/bloc/state/character_detail_state.dart';
import 'package:marvel_api/character_detail/usecase/character_detail_usecase.dart';
import 'package:marvel_api/character_list/usecase/model/character_model.dart';
import 'package:marvel_api/commons/components/headline_text.dart';
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
              return _LoadedDetail(
                  character: (state as LoadedDetail).characterDetail);
            case Error:
            default:
              return const Text('Error');
          }
        },
      ),
    );
  }
}

class _LoadedDetail extends StatelessWidget {
  _LoadedDetail({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _CharacterThumbnail(character: character),
          const SizedBox(height: 16.0),
          _CharacterDescription(
            character: character,
          ),
          const SizedBox(height: 16.0),
          _ComicsList(comics: character.comics)
        ],
      ),
    );
  }
}

class _CharacterDescription extends StatelessWidget {
  _CharacterDescription({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    if (character.description.isNotEmpty) {
      return Column(
        children: [
          HeadlineText('Description'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(character.description),
          ),
        ],
      );
    }

    return Container();
  }
}

class _ComicsList extends StatelessWidget {
  const _ComicsList({
    Key? key,
    required this.comics,
  }) : super(key: key);

  final List<Comic> comics;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadlineText('Comics List'),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: comics.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: _ComicItem(
              comic: comics[index],
            ),
          ),
        ),
      ],
    );
  }
}

class _ComicItem extends StatelessWidget {
  const _ComicItem({
    Key? key,
    required this.comic,
  }) : super(key: key);

  final Comic comic;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          comic.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _CharacterThumbnail extends StatelessWidget {
  const _CharacterThumbnail({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(character.thumbnailPath),
      ],
    );
  }
}
