// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:marvel_api/character_detail/presentation/character_detail_screen.dart';
import 'package:nuvigator/next.dart';

class CharacterDetailRoute extends NuRoute {
  @override
  Widget build(BuildContext context, NuRouteSettings<Object> settings) {
    return ChracterDetailContainer(
      characterId: settings.rawParameters['characterId'],
      characterName: settings.rawParameters['characterName'],
    );
  }

  @override
  String get path => 'character';

  @override
  ScreenType get screenType => materialScreenType;
}
