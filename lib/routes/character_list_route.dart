// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:marvel_api/character_list/presentation/character_list_screen.dart';
import 'package:nuvigator/next.dart';

class CharacterListRoute extends NuRoute {
  @override
  Widget build(BuildContext context, NuRouteSettings<Object> settings) {
    return CharacterListContainer(
      onCharacterClick: (parameters) => nuvigator.open(
        'marvelapp://character',
        parameters: parameters,
      ),
    );
  }

  @override
  String get path => 'characters';

  @override
  ScreenType get screenType => materialScreenType;
}
