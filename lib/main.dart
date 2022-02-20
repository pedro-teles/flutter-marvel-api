import 'package:flutter/material.dart';
import 'package:marvel_api/character_list/connector/character_list_connector.dart';
import 'package:marvel_api/character_list/presentation/character_list_screen.dart';
import 'package:marvel_api/character_list/repository/character_list_repository.dart';
import 'package:marvel_api/character_list/usecase/character_list_usecase.dart';
import 'package:marvel_api/character_list/usecase/character_list_usecase_impl.dart';
import 'package:provider/provider.dart';

import 'character_list/repository/character_list_repository_impl.dart';

void main() {
  runApp(const MarvelApp());
}

class MarvelApp extends StatelessWidget {
  const MarvelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CharacterListConnector(path: 'characters'),
        ),
        ProxyProvider<CharacterListConnector, CharacterListRepository>(
          update: (context, connector, repository) =>
              CharacterListRepositoryImpl(connector),
        ),
        ProxyProvider<CharacterListRepository, CharacterListUseCase>(
          update: (context, repository, useCase) =>
              CharacterListUseCaseImpl(repository),
        ),
      ],
      child: MaterialApp(
        title: 'Marvel App',
        theme: ThemeData(
          primaryColor: Colors.red[600],
          fontFamily: 'Roboto',
        ),
        home: const CharacterListContainer(),
      ),
    );
  }
}
