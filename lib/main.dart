import 'package:flutter/material.dart';
import 'package:marvel_api/character_detail/repository/character_detail_repository.dart';
import 'package:marvel_api/character_detail/repository/character_detail_repository_impl.dart';
import 'package:marvel_api/character_detail/usecase/character_detail_usecase.dart';
import 'package:marvel_api/character_detail/usecase/character_detail_usecase_impl.dart';
import 'package:marvel_api/commons/connector/character_service.dart';
import 'package:marvel_api/character_list/repository/character_list_repository.dart';
import 'package:marvel_api/character_list/usecase/character_list_usecase.dart';
import 'package:marvel_api/character_list/usecase/character_list_usecase_impl.dart';
import 'package:marvel_api/main_router.dart';
import 'package:nuvigator/nuvigator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
        ...dataProviders(),
        ...domainProviders(),
      ],
      child: MaterialApp(
        title: 'Marvel App',
        theme: ThemeData(
          primaryColor: Colors.red[600],
          fontFamily: 'Roboto',
        ),
        home: Nuvigator(
          router: MainRouter(),
        ),
      ),
    );
  }
}

List<SingleChildWidget> dataProviders() => [
      Provider(
        create: (context) => CharacterService(path: 'characters'),
      ),
      ProxyProvider<CharacterService, CharacterListRepository>(
        update: (context, service, repository) =>
            CharacterListRepositoryImpl(service),
      ),
      ProxyProvider<CharacterService, CharacterDetaiLRepository>(
        update: (context, service, repository) =>
            CharacterDetailRepositoryImpl(service),
      ),
    ];

List<SingleChildWidget> domainProviders() => [
      ProxyProvider<CharacterListRepository, CharacterListUseCase>(
        update: (context, repository, useCase) =>
            CharacterListUseCaseImpl(repository),
      ),
      ProxyProvider<CharacterDetaiLRepository, CharacterDetailUseCase>(
        update: (context, repository, useCase) =>
            CharacterDetailUseCaseImpl(repository),
      )
    ];
