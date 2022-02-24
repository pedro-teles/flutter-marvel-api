import 'package:marvel_api/character_list/usecase/model/character_model.dart';

abstract class CharacterDetailState {}

class LoadingDetail extends CharacterDetailState {}

class LoadedDetail extends CharacterDetailState {
  LoadedDetail(this.characterDetail);

  final Character characterDetail;
}

class ErrorDetail extends CharacterDetailState {}
