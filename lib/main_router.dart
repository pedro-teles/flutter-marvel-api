import 'package:marvel_api/routes/character_detail_route.dart';
import 'package:marvel_api/routes/character_list_route.dart';
import 'package:nuvigator/next.dart';

class MainRouter extends NuRouter {
  @override
  String get initialRoute => 'characters';

  @override
  List<NuRoute<NuRouter, Object, Object>> get registerRoutes => [
        CharacterListRoute(),
        CharacterDetailRoute(),
      ];
}
