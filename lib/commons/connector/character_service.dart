import 'dart:convert';

import 'package:marvel_api/character_detail/connector/model/character_detail_response.dart';
import 'package:marvel_api/character_list/connector/model/character_list_response.dart';
import 'package:marvel_api/commons/connector/connector.dart';

class CharacterService extends Connector {
  CharacterService({required this.path}) : super();

  final String path;

  Future<CharacterListResponse?> getCharacterList() async {
    final response = await client.get(
      Uri.parse('$baseUrl$path'),
      params: requestParameters,
    );

    if (response.statusCode == 200) {
      return CharacterListResponse.fromJson(jsonDecode(response.body));
    }
  }

  Future<CharacterDetailResponse?> getCharacterDetail(int characterId) async {
    final response = await client.get(Uri.parse('$baseUrl$path/$characterId'),
        params: requestParameters);

    if (response.statusCode == 200) {
      return CharacterDetailResponse.fromJson(jsonDecode(response.body));
    }
  }
}
