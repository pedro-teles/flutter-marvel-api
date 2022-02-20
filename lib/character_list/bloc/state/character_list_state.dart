import 'package:marvel_api/character_list/usecase/model/character_model.dart';

abstract class CharacterListState {}

class LoadingList extends CharacterListState {}

class LoadedList extends CharacterListState {
  LoadedList(this.characters);

  final List<Character> characters;
}

class Error extends CharacterListState {}
