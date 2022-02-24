import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/character_list/bloc/character_list_cubit.dart';
import 'package:marvel_api/character_list/bloc/state/character_list_state.dart';
import 'package:marvel_api/character_list/usecase/character_list_usecase.dart';
import 'package:marvel_api/character_list/usecase/model/character_model.dart';
import 'package:marvel_api/commons/components/loading_screen.dart';
import 'package:provider/provider.dart';

class CharacterListContainer extends StatelessWidget {
  const CharacterListContainer({Key? key, required this.onCharacterClick})
      : super(key: key);

  final Function onCharacterClick;

  @override
  Widget build(BuildContext context) {
    final useCase = Provider.of<CharacterListUseCase>(context);

    return BlocProvider(
      create: (_) {
        final cubit = CharacterListCubit(useCase);

        cubit.getCharacterList();

        return cubit;
      },
      child: CharacterListScreen(onCharacterClick),
    );
  }
}

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen(this.onCharacterClick, {Key? key})
      : super(key: key);

  final Function onCharacterClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel App'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocBuilder<CharacterListCubit, CharacterListState>(
          builder: (context, state) {
        switch (state.runtimeType) {
          case LoadingList:
            return LoadingScreen();
          case LoadedList:
            return _CharacterList(
              characterList: (state as LoadedList).characters,
              onCharacterClick: onCharacterClick,
            );
          case Error:
          default:
            return const Text('Error');
        }
      }),
    );
  }
}

class _CharacterList extends StatelessWidget {
  const _CharacterList(
      {Key? key, required this.characterList, required this.onCharacterClick})
      : super(key: key);

  final List<Character> characterList;
  final Function onCharacterClick;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characterList.length,
      itemBuilder: (context, index) {
        final character = characterList[index];
        return _CharacterCard(
          character: character,
          onCharacteClick: onCharacterClick,
        );
      },
    );
  }
}

class _CharacterCard extends StatelessWidget {
  const _CharacterCard(
      {Key? key, required this.character, required this.onCharacteClick})
      : super(key: key);

  final Character character;
  final Function onCharacteClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(18.0),
      child: GestureDetector(
        onTap: () => onCharacteClick(
          {
            'characterId': character.id,
            'characterName': character.name,
          },
        ),
        child: Column(
          children: [
            Image.network(
              character.thumbnailPath,
            ),
            const SizedBox(height: 16.0),
            Text(
              character.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
